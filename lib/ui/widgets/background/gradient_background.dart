import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  double? height;
  double? width;
  Color colorBotLeft, colorTopRight, colorDecorationA, colorDecorationB;
  double screenWidth, screenHeight;
  GradientBackground({
    super.key,
    this.width,
    this.height,
    required this.colorBotLeft,
    required this.colorTopRight,
    required this.colorDecorationA,
    required this.colorDecorationB,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    //size (if not given)
    if (height == null || height == 0) {
      height = screenHeight;
    }
    if (width == null || width == 0) {
      width = screenWidth;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorBotLeft,
            colorTopRight,
          ],
          begin: const FractionalOffset(0, 1.0),
          end: const FractionalOffset(1.0, 0),
          //stops: [0.0, 0.5], //in here the gradient would end at the middle (0.5)
          tileMode: TileMode.clamp, //what happens while gradient is loading and not visible (I think)
        ),
      ),
      child: FittedBox(
        fit: BoxFit.none, //in here we let the child to have its center outside the given box
        alignment: const Alignment(-1.5, -10), //where the child's center will be
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                colorDecorationA,
                colorDecorationB,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
