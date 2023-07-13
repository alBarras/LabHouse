import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';

class CustomTextInput extends StatefulWidget {
  final Function(String) onChanged;
  VoidCallback? onTap, onSubmitted;

  String title;
  String initialText;
  String hintText;
  TextEditingController controller;
  int maxLines, maxLength;
  double width;
  bool? deactivated;

  CustomTextInput({
    super.key,
    required this.onChanged,
    required this.title,
    required this.initialText,
    required this.hintText,
    required this.controller,
    required this.maxLines,
    required this.maxLength,
    required this.width,
    this.onTap,
    this.onSubmitted,
    this.deactivated,
  });

  @override
  _CustomTextInput createState() => _CustomTextInput();
}

class _CustomTextInput extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        readOnly: widget.deactivated != null && widget.deactivated!,
        onSubmitted: (b) {
          if (widget.onSubmitted != null) widget.onSubmitted!();
        },
        textAlignVertical: TextAlignVertical.bottom,
        onChanged: (text) {
          widget.onChanged(text);
        },
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
        },
        controller: widget.controller,
        keyboardType: TextInputType.text,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        style: const TextStyle(fontSize: 15.0, fontFamily: "Lato", color: BODY_TEXT_COLOR, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          labelText: widget.title,
          labelStyle: const TextStyle(
            color: TITLE_TEXT_COLOR,
            fontSize: 15,
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
          counterStyle: const TextStyle(color: HINT_TEXT_COLOR),
          floatingLabelBehavior: FloatingLabelBehavior.always, //always show labelText
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: HINT_TEXT_COLOR, fontSize: 15, fontStyle: FontStyle.normal),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: MAIN_COLOR_80), borderRadius: BorderRadius.all(Radius.circular(9.0))),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: MAIN_COLOR_80), borderRadius: BorderRadius.all(Radius.circular(9.0))),
        ),
      ),
    );
  }
}
