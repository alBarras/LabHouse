import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';
import 'package:labhouse_albert/code_assets/sizes.dart';
import 'package:labhouse_albert/code_assets/strings.dart';
import 'package:labhouse_albert/ui/widgets/bezier/ui/bezier_handle.dart';
import 'package:labhouse_albert/ui/widgets/custom_button.dart';
import 'package:labhouse_albert/ui/widgets/custom_dialog.dart';
import 'package:labhouse_albert/ui/widgets/custom_text_input.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/model/model_parallax_item.dart';
import 'package:labhouse_albert/utils.dart';

class InputScreen extends StatefulWidget {
  AnimationController animationController;
  bool hideOutputScreenTotally;
  String inputText;
  Function(String) inputTextChanged;
  VoidCallback hideResults, processInputText, noInternet, showPreviousResults, cancelLoading, decreaseInputAmount, increaseInputAmount;
  int? inputAmount;
  bool loading;
  bool isDebugImages;
  List<ModelParallaxItem> modelParallaxItems;
  double screenWidth, screenHeight;

  InputScreen({
    Key? key,
    required this.animationController,
    required this.hideOutputScreenTotally,
    required this.inputText,
    required this.inputTextChanged,
    required this.hideResults,
    required this.processInputText,
    required this.noInternet,
    required this.showPreviousResults,
    required this.cancelLoading,
    required this.decreaseInputAmount,
    required this.increaseInputAmount,
    required this.inputAmount,
    required this.loading,
    required this.modelParallaxItems,
    required this.screenWidth,
    required this.screenHeight,
    required this.isDebugImages,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InputScreen();
  }
}

class _InputScreen extends State<InputScreen> {
  final int MIN_QUERY_LENGTH = 2;
  final int MAX_QUERY_LENGTH = 75;
  final int MIN_INPUT_AMOUNT = 5;
  final int MAX_INPUT_AMOUNT = 30;

  @override
  Widget build(BuildContext context) {
    return _buildInputScreenContent();
  }

  Widget _buildInputScreenContent() {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            //Top Title
            Opacity(
              opacity: 1 - widget.animationController.value,
              child: const Column(
                children: [
                  SizedBox(height: 70),
                  Center(
                    child: Text(
                      APP_TITLE,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        shadows: [
                          Shadow(
                            color: SHADOW_COLOR,
                            blurRadius: 5,
                            offset: Offset(2, 2), // Adjust the position of the shadow
                          ),
                        ],
                        color: TITLE_TEXT_COLOR,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            //Input
            Column(
              children: [
                SizedBox(
                  height: MIN_TOP_SCREEN_PAD_SIZE + (200 - 200 * widget.animationController.value),
                ),
                Row(
                  children: [
                    const Spacer(),
                    //Input Text
                    CustomTextInput(
                      title: INPUT_TEXT_TITLE,
                      initialText: widget.inputText,
                      hintText: INPUT_TEXT_HINT,
                      controller: TextEditingController(),
                      maxLines: QUERY_TEXT_LINES_NUM,
                      maxLength: MAX_QUERY_LENGTH,
                      width: 300,
                      onChanged: (text) {
                        widget.inputTextChanged(text);
                      },
                      onTap: () {
                        if (!widget.hideOutputScreenTotally) widget.hideResults();
                      },
                      onSubmitted: () {
                        checkAndProcessInputText();
                      },
                    ),
                    const Spacer(),
                  ],
                ),

                //Amount Items
                const SizedBox(height: 40),
                const Text(
                  ITEM_COUNT_TITLE,
                  style: TextStyle(
                    color: TITLE_TEXT_COLOR,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: LIGHT_SHADOW_COLOR,
                        blurRadius: 5,
                        offset: Offset(2, 2), // Adjust the position of the shadow
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Spacer(),
                    CustomButton(
                      width: 40,
                      height: 40,
                      borderRadius: 20,
                      isDisabled: widget.inputAmount != null && !(MIN_INPUT_AMOUNT < widget.inputAmount! && !widget.loading),
                      text: "-",
                      onTap: () {
                        try {
                          FocusManager.instance.primaryFocus?.unfocus(); //hide keyboard
                        } catch (e) {}
                        if (widget.inputAmount != null && MIN_INPUT_AMOUNT < widget.inputAmount! && !widget.loading) {
                          widget.decreaseInputAmount();
                        }
                      },
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 20,
                      child: Text(
                        widget.inputAmount != null ? widget.inputAmount.toString() : "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: BODY_TEXT_COLOR,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CustomButton(
                      width: 40,
                      height: 40,
                      borderRadius: 20,
                      isDisabled: widget.inputAmount != null && !(widget.inputAmount! < MAX_INPUT_AMOUNT && !widget.loading),
                      text: "+",
                      onTap: () {
                        try {
                          FocusManager.instance.primaryFocus?.unfocus(); //hide keyboard
                        } catch (e) {}
                        if (widget.inputAmount != null && widget.inputAmount! < MAX_INPUT_AMOUNT && !widget.loading) {
                          widget.increaseInputAmount();
                        }
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                //Proceed Button
                Visibility(
                  visible: !widget.loading,
                  child: CustomButton(
                    text: SEARCH_BUTTON_TEXT,
                    onTap: () {
                      try {
                        FocusManager.instance.primaryFocus?.unfocus(); //hide keyboard
                      } catch (e) {}
                      checkAndProcessInputText();
                    },
                  ),
                ),
                //Loading Indicator (showed in any waiting scenario)
                Visibility(
                  visible: widget.loading,
                  child: const Column(
                    children: [
                      CircularProgressIndicator(color: LOADING_INDICATOR_COLOR),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                //Cancel Button
                Visibility(
                  visible: widget.loading,
                  child: CustomButton(
                    text: CANCEL_BUTTON_TEXT,
                    onTap: () {
                      try {
                        FocusManager.instance.primaryFocus?.unfocus(); //hide keyboard
                      } catch (e) {}
                      //cancel current query (the user will need to wait for this query to end to do a new one)
                      widget.cancelLoading();
                    },
                  ),
                ),
                const Spacer(),
                //LabHouse Logo
                Image.asset('assets/img/labhouse_logo_big.png'),
                const SizedBox(height: 50),
              ],
            ),

            //Reopen last loaded list
            Visibility(
              visible: widget.modelParallaxItems.isNotEmpty && widget.animationController.isDismissed,
              child: Column(
                children: [
                  const Spacer(),
                  Stack(
                    children: [
                      SizedBox(
                        height: LIST_HANDLE_HEIGHT_SIZE,
                        width: widget.screenWidth,
                        child: BezierHandle(
                          color: MAIN_COLOR_WHITE,
                          screenHeight: widget.screenHeight,
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          child: const Icon(Icons.keyboard_arrow_up_rounded, size: 50),
                          onTap: () {
                            widget.showPreviousResults();
                          },
                          onVerticalDragDown: (b) {
                            widget.showPreviousResults();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  checkAndProcessInputText() {
    //Check there is internet
    checkInternet();
    //Check not initializing still
    if (widget.inputAmount == null) return;
    //Check minimum query length
    if (widget.inputText.length < MIN_QUERY_LENGTH && !widget.isDebugImages) {
      showDialog(
        context: context,
        builder: (_) => CustomDialog(
          title: INPUT_EMPTY_MESSAGE_TITLE,
          msg: INPUT_EMPTY_MESSAGE_TEXT,
          buttonActions: const [null],
          buttonTexts: const [OK_TEXT],
        ),
        barrierDismissible: true,
      );
      return;
    }
    //Proceed normally
    widget.processInputText();
  }

  checkInternet() {
    Utils.isInternet().then((isInternet) {
      if (!isInternet) {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(title: NO_INTERNET_MESSAGE_TITLE, msg: NO_INTERNET_MESSAGE_TEXT, buttonActions: const [null], buttonTexts: const [OK_TEXT]),
          barrierDismissible: true,
        );
        widget.noInternet();
      }
    });
  }
}
