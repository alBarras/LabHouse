import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';

late AlertDialog _customAlertDialog;

Color defaultBgColor = MAIN_COLOR_80;
Color defaultBorderColor = Colors.transparent;
double defaultBorderStroke = 0;
Color defaultTextColor = SECUNDARY_BODY_TEXT_COLOR;
Color defaultTitleColor = BODY_TEXT_COLOR;
Color defaultButtonTextColors = BODY_TEXT_COLOR;
Color defaultQuitDialogButtonColor = BODY_TEXT_COLOR;

class CustomDialog extends StatefulWidget {
  String? title, msg;

  List<Widget>? actions; //'actions' has preference over 'buttonActions' (if 'actions' is given, it does not matter if 'buttonActions'/'buttonTexts'/'buttonTextColors' are given or not)
  List<VoidCallback?>? buttonActions;
  List<String>? buttonTexts;
  List<Color>? buttonTextColors;
  List<bool>? quitsDialog;
  String? quitDialogButtonText;
  Color? quitDialogButtonColor;
  Color? bgColor, borderColor;
  double? borderStroke;

  CustomDialog({super.key, this.actions, this.title, this.bgColor, this.borderColor, this.borderStroke, this.msg, this.buttonActions, this.buttonTexts, this.quitsDialog, this.quitDialogButtonText, this.quitDialogButtonColor, this.buttonTextColors});

  @override
  State<StatefulWidget> createState() {
    return _CustomDialog();
  }
}

class _CustomDialog extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    //default quitsDialog
    if ((widget.quitsDialog == null || widget.quitsDialog == List.empty()) && widget.buttonTexts != null) {
      widget.quitsDialog = [];
      for (int i = 0; i < widget.buttonTexts!.length; i++) {
        widget.quitsDialog!.add(true);
      }
    }
    //default buttonTextColors
    if (widget.buttonTexts != null) {
      widget.buttonTextColors = [];
      for (int i = 0; i < widget.buttonTexts!.length; i++) {
        widget.buttonTextColors!.add(defaultButtonTextColors);
      }
    }
    //default quit button color
    widget.quitDialogButtonColor = defaultQuitDialogButtonColor;
    //defaul bgColor
    widget.bgColor ??= defaultBgColor;
    //defaul borderColor
    widget.borderColor ??= defaultBorderColor;
    //defaul borderStroke
    widget.borderStroke ??= defaultBorderStroke;

    Text? title, msg;
    if (widget.title == null || widget.title!.isEmpty) {
      title = null;
    } else {
      title = Text(
        widget.title!,
        style: TextStyle(color: defaultTitleColor),
      );
    }
    if (widget.msg == null || widget.msg!.isEmpty) {
      msg = null;
    } else {
      msg = Text(widget.msg!, style: TextStyle(color: defaultTextColor));
    }

    //Buttons
    List<Widget> buttons = [];
    if (widget.buttonTexts != null && widget.buttonTexts!.isNotEmpty) {
      for (int i = 0; i < widget.buttonTexts!.length; i++) {
        buttons.add(InkWell(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Text(widget.buttonTexts![i], style: TextStyle(color: widget.buttonTextColors![i], fontFamily: "Lato", fontWeight: FontWeight.bold)),
          ),
          onTap: () {
            if (widget.quitsDialog![i]) {
              Navigator.pop(context);
            }
            if (widget.buttonActions![i] != null) {
              widget.buttonActions![i]!();
            }
          },
        ));
      }
    }
    if (widget.quitDialogButtonText != null && widget.quitDialogButtonText!.isNotEmpty) {
      buttons.add(InkWell(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Text(widget.quitDialogButtonText!, style: TextStyle(color: widget.quitDialogButtonColor!, fontFamily: "Lato", fontWeight: FontWeight.bold)),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ));
    }

    _customAlertDialog = AlertDialog(
      //title & text
      title: title,
      content: msg,
      actions: widget.actions ?? buttons,
      elevation: 100.0,
      backgroundColor: widget.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        side: BorderSide(
          color: widget.borderColor!,
          width: widget.borderStroke!,
        ),
      ),
      scrollable: true,
    );

    return _customAlertDialog;
  }
}
