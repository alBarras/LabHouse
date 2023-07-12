import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';
import 'package:labhouse_albert/code_assets/sizes.dart';
import 'package:labhouse_albert/ui/widgets/bezier/ui/bezier_handle.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/model/model_parallax_item.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/ui/parallax_list.dart';

class OutputScreen extends StatefulWidget {
  List<ModelParallaxItem> modelParallaxItems;
  bool hideListItems;
  VoidCallback hideResults, hideOutputScreenTotally;
  Function(ModelParallaxItem modelParallaxItem) showFullImage;
  AnimationController animationController;
  double screenWidth, screenHeight;

  OutputScreen({
    Key? key,
    required this.modelParallaxItems,
    required this.hideListItems,
    required this.hideResults,
    required this.hideOutputScreenTotally,
    required this.showFullImage,
    required this.animationController,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OutputScreen();
  }
}

class _OutputScreen extends State<OutputScreen> with TickerProviderStateMixin {
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    Offset initialTranslation = const Offset(0.0, 1);
    Offset finalTranslation = const Offset(0.0, 0.0);
    final tween = Tween<Offset>(begin: initialTranslation, end: finalTranslation); //interpolation
    _animation = tween.animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        //slide in output screen
        return FractionalTranslation(
          translation: _animation.value,
          child: _buildOutputScreenContent(),
        );
      },
    );
  }

  Widget _buildOutputScreenContent() {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: MIN_TOP_SCREEN_PAD_SIZE + QUERY_TEXT_LINES_NUM * 50),
            //List Handle
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
                    child: const Icon(Icons.keyboard_arrow_down_rounded, size: 50),
                    onTap: () {
                      widget.hideResults();
                    },
                    onVerticalDragDown: (b) {
                      widget.hideResults();
                    },
                  ),
                ),
              ],
            ),
            //Actual List
            Expanded(
              child: Container(
                color: MAIN_COLOR_WHITE,
                child: ParallaxList(
                  modelParallaxItems: widget.modelParallaxItems,
                  hideItems: widget.hideListItems,
                  quitList: () {
                    widget.hideResults();
                  },
                  pressedOnImage: (modelParallaxItem) {
                    widget.showFullImage(modelParallaxItem);
                  },
                ),
              ),
            ),
          ],
        ),
        //There is a small non-collored line between the handle and the actual list which we hide with the following container
        Container(
          margin: const EdgeInsets.only(top: MIN_TOP_SCREEN_PAD_SIZE + QUERY_TEXT_LINES_NUM * 50 + LIST_HANDLE_HEIGHT_SIZE - LIST_HANDLE_EMBELLISHER_HEIGHT_SIZE / 2),
          height: LIST_HANDLE_EMBELLISHER_HEIGHT_SIZE,
          color: MAIN_COLOR_WHITE,
        ),
      ],
    );
  }
}
