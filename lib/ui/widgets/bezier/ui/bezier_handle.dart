import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';
import 'package:labhouse_albert/ui/widgets/bezier/model/clip_shadow_path.dart';
import 'package:labhouse_albert/ui/widgets/bezier/model/custom_clippers.dart';

double smallYscale = 0.3, medYscale = 0.5, bigYscale = 0.7;

class BezierHandle extends StatelessWidget {
  final Color color;
  final double screenHeight;
  Color? colorBg, colorShadow;
  Offset? shadowOffset;
  BezierHandle({Key? key, required this.color, required this.screenHeight, this.colorBg, this.colorShadow, this.shadowOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    colorBg ??= Colors.transparent;
    colorShadow ??= SHADOW_COLOR;
    shadowOffset ??= const Offset(0, 5);

    return Scaffold(
      backgroundColor: colorBg,
      body: ClipShadowPath(
        shadow: BoxShadow(
          color: colorShadow!,
          offset: shadowOffset!,
          blurRadius: 4,
          spreadRadius: 8,
        ),
        clipper: HandleClipper(),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
