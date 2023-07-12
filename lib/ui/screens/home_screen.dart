import 'package:flutter/material.dart';
import 'package:labhouse_albert/apis/openai/openai_api.dart';
import 'package:labhouse_albert/apis/unsplash/unsplash_api.dart';
import 'package:labhouse_albert/code_assets/debug.dart';
import 'package:labhouse_albert/code_assets/durations.dart';
import 'package:labhouse_albert/code_assets/strings.dart';
import 'package:labhouse_albert/ui/screens/full_image_screen.dart';
import 'package:labhouse_albert/ui/screens/input_screen.dart';
import 'package:labhouse_albert/ui/screens/output_screen.dart';
import 'package:labhouse_albert/ui/widgets/background/custom_background.dart';
import 'package:labhouse_albert/ui/widgets/custom_dialog.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/model/model_parallax_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  static bool debugImages = false;
  static late final _sharedPreferences;
  late double _screenHeight, _screenWidth;

  //FULL IMAGE
  ModelParallaxItem? _fullImageItem;
  late AnimationController _fullImageAnimationController;

  //INPUT
  bool _loading = false;
  int _lastCallNum = 0;
  String _inputText = "";
  int? _inputAmount;

  //OUTPUT
  List<ModelParallaxItem> _modelParallaxItems = [];
  bool _hideListItems = false;
  bool _hideOutputScreenTotally = true; //hide screen completelly
  late AnimationController _outputScreenAnimationController;
  String _originalInputText = "";

  @override
  void initState() {
    super.initState();

    //Shared prefs
    SharedPreferences.getInstance().then((sp) {
      _sharedPreferences = sp;
      _inputAmount = _sharedPreferences.getInt(LABHOUSE_HOME_SCREEN_INPUT_AMOUNT) ?? 10;
      _sharedPreferences.setInt(LABHOUSE_HOME_SCREEN_INPUT_AMOUNT, _inputAmount);
      setState(() {});
    });

    //Output screen animation
    _outputScreenAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _outputScreenAnimationController.addStatusListener((status) {
      //hide output screen totally when it has ended hiding (so the input screen buttons can be pressed again)
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _hideOutputScreenTotally = true;
        });
      }
    });

    //Full image animation
    _fullImageAnimationController = AnimationController(
      vsync: this,
      duration: OPACITY_ANIMATION_DURATION,
    );
    _fullImageAnimationController.addStatusListener((status) {
      //hide full image totally when it has ended hiding (so the input screen buttons can be pressed again)
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _fullImageItem = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _outputScreenAnimationController.dispose();
    _fullImageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return _buildHomeScreenContent();
  }

  Widget _buildHomeScreenContent() {
    Widget contentWidget = Stack(
      children: [
        //Background
        CustomBackground(
          screenWidth: _screenWidth,
          screenHeight: _screenHeight,
        ),

        //Input Screen
        InputScreen(
          screenWidth: _screenWidth,
          screenHeight: _screenHeight,
          isDebugImages: debugImages,
          animationController: _outputScreenAnimationController,
          hideOutputScreenTotally: _hideOutputScreenTotally,
          inputText: _inputText,
          inputTextChanged: (text) {
            setState(() {
              _inputText = text;
            });
          },
          hideResults: () {
            hideResults();
          },
          processInputText: () {
            processInputText();
          },
          noInternet: () {
            setState(() {
              _loading = false;
            });
          },
          showPreviousResults: () {
            showPreviousResults();
          },
          cancelLoading: () {
            setState(() {
              _loading = false;
            });
          },
          decreaseInputAmount: () {
            setState(() {
              _inputAmount = _inputAmount! - 1;
            });
            _sharedPreferences.setInt(LABHOUSE_HOME_SCREEN_INPUT_AMOUNT, _inputAmount!);
          },
          increaseInputAmount: () {
            setState(() {
              _inputAmount = _inputAmount! + 1;
            });
            _sharedPreferences.setInt(LABHOUSE_HOME_SCREEN_INPUT_AMOUNT, _inputAmount!);
          },
          inputAmount: _inputAmount,
          loading: _loading,
          modelParallaxItems: _modelParallaxItems,
        ),

        //Output Screen
        Visibility(
          visible: !_hideOutputScreenTotally,
          child: OutputScreen(
            screenWidth: _screenWidth,
            screenHeight: _screenHeight,
            modelParallaxItems: _modelParallaxItems,
            hideListItems: _hideListItems,
            hideOutputScreenTotally: () {
              setState(() {
                _hideOutputScreenTotally = true;
              });
            },
            hideResults: () {
              hideResults();
            },
            showFullImage: (modelParallaxItem) {
              //avoid showing images if the list is already hiding
              if (!_outputScreenAnimationController.isCompleted) return;
              //actually show the full image
              setState(() {
                _fullImageItem = modelParallaxItem;
              });
              _fullImageAnimationController.forward();
            },
            animationController: _outputScreenAnimationController,
          ),
        ),

        //Full Image Screen
        Visibility(
          visible: _fullImageItem != null,
          child: FullImageScreen(
            screenWidth: _screenWidth,
            item: _fullImageItem,
            close: () {
              _fullImageAnimationController.reverse();
            },
            animationController: _fullImageAnimationController,
          ),
        ),
      ],
    );

    //Hide keyboard when clicking anywhere else and handle the android back button
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: () {
          try {
            FocusManager.instance.primaryFocus?.unfocus();
          } catch (e) {}
        },
        child: contentWidget,
      ),
    );
  }

  processInputText() {
    //show loading indicator
    setState(() {
      _lastCallNum++;
      _loading = true;
    });
    //debug case
    if (debugImages) {
      showNewResults(TEST_ITEMS);
      return;
    }
    //normal case
    OpenaiApi.getItemsWithKeywordList(_inputText, _inputAmount!, 50, _lastCallNum).then((response) async {
      try {
        List<List<String>> itemsWithKeywordList = response[0];
        int callNum = response[1];
        if (!_loading || callNum != _lastCallNum) {
          //if this is the response from a cancelled query, ignore it
          return;
        }
        if (itemsWithKeywordList.isNotEmpty) {
          //get an image URL and create a ModelParallaxItem for each item
          List<String> picUrls = await UnsplashApi.queryListOfPics(itemsWithKeywordList[1], 2);
          if (!picUrls.contains("")) {
            List<ModelParallaxItem> modelParallaxItems = [];
            for (int i = 0; i < itemsWithKeywordList[0].length; i++) {
              modelParallaxItems.add(ModelParallaxItem(name: itemsWithKeywordList[0][i], imageUrl: picUrls[i], description: itemsWithKeywordList[2][i]));
            }
            showNewResults(modelParallaxItems);
            return;
          }
        }
      } catch (e) {}
      //Error
      showDialog(
        context: context,
        builder: (_) => CustomDialog(title: ERROR_MESSAGE_TITLE, msg: ERROR_MESSAGE_TEXT, buttonActions: const [null], buttonTexts: const [OK_TEXT]),
        barrierDismissible: true,
      );
      setState(() {
        _loading = false;
      });
    });
  }

  //Show the already previously loaded list
  showPreviousResults() {
    setState(() {
      _inputText = _originalInputText; //set the previous input text too
      _hideOutputScreenTotally = false;
      _outputScreenAnimationController.forward();
    });
  }

  //Show a newly loaded list
  showNewResults(List<ModelParallaxItem> modelParallaxItems) {
    _originalInputText = _inputText; //save the original input text in case we repoen the list
    setState(() {
      _loading = false;
      _modelParallaxItems = modelParallaxItems;
      _hideOutputScreenTotally = false;
      _outputScreenAnimationController.forward();
    });
  }

  //Hide the current list, will be an option to show it again
  hideResults() {
    setState(() {
      _hideListItems = true;
      _outputScreenAnimationController.reverse();
    });
    Future.delayed(PIC_SLIDE_IN_ANIMATION_DURATION, () {
      setState(() {
        _hideListItems = false;
      });
    });
  }
}
