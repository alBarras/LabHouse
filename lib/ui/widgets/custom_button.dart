import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';

class CustomButton extends StatelessWidget {
  double? height;
  double? width;
  double? borderRadius;
  Color? color;
  Color? textColor;
  bool? isDisabled;
  String text;
  VoidCallback onTap;
  CustomButton({super.key, this.width, this.height, this.borderRadius, this.textColor, this.color, this.isDisabled, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: height ?? 50,
        width: width ?? 100,
        decoration: BoxDecoration(
          color: (isDisabled!=null && isDisabled!) ? DISABLED_COLOR : (color ?? MAIN_COLOR_87),
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
          boxShadow: const [
            BoxShadow(
              color: SHADOW_COLOR,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(3, 3), // Adjust the position of the shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor ?? BODY_TEXT_COLOR,
            ),
          ),
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
