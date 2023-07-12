import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';
import 'package:labhouse_albert/ui/widgets/background/gradient_background.dart';
import 'package:labhouse_albert/ui/widgets/bezier/ui/moving_bezier_background.dart';

class CustomBackground extends StatefulWidget {
  double screenHeight, screenWidth;
  CustomBackground({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(
          colorBotLeft: MAIN_COLOR_33,
          colorTopRight: MAIN_COLOR_60,
          colorDecorationA: const Color.fromARGB(75, 0, 0, 0),
          colorDecorationB: Colors.transparent,
          screenWidth: widget.screenWidth,
          screenHeight: widget.screenHeight,
        ),
        MovingBezierBackground(
          colorTop: BEZIER_BACKGROUND_A,
          colorMid: BEZIER_BACKGROUND_B,
          colorBot: Colors.transparent,
          screenHeight: widget.screenHeight,
          bigVisible: false,
          smallYscale: 0.12,
          medYscale: 0.22,
          upsideDown: true,
        ),
      ],
    );
  }
}
