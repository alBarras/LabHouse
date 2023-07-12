import 'package:flutter/material.dart';
import 'package:labhouse_albert/ui/widgets/bezier/model/clip_shadow_path.dart';
import 'package:labhouse_albert/ui/widgets/bezier/model/custom_clippers.dart';
import 'package:quiver/async.dart';

class MovingBezierBackground extends StatefulWidget {
  Color colorTop, colorMid, colorBot;
  Color? colorBg, colorShadowTop, colorShadowMid, colorShadowBot;
  double screenHeight;
  double? smallYscale, medYscale, bigYscale;
  bool? smallVisible, medVisible, bigVisible, upsideDown;
  Offset? shadowOffset;

  MovingBezierBackground({
    Key? key,
    this.smallVisible,
    this.medVisible,
    this.bigVisible,
    this.upsideDown,
    this.smallYscale,
    this.medYscale,
    this.bigYscale,
    required this.screenHeight,
    required this.colorTop,
    required this.colorMid,
    required this.colorBot,
    this.colorBg,
    this.colorShadowTop,
    this.colorShadowMid,
    this.colorShadowBot,
    this.shadowOffset,
  }) : super(key: key);

  @override
  State<MovingBezierBackground> createState() => _MovingBezierBackgroundState();
}

class _MovingBezierBackgroundState extends State<MovingBezierBackground> {
  double bezierLinesProgressVelocity = 0.001; //0.001; //speed in which the bezier curves move
  Duration bezierLinesProgressTickDuration = const Duration(milliseconds: 1); //how often the screen refreshes
  Duration bezierLinesProgressTotalDuration = const Duration(days: 365); // we want it to be infinity, but 1 year seems fair enough
  var sub;
  double _bezierLinesProgress = 0;

  @override
  void initState() {
    _startBezierProgressTimer();
  }

  @override
  Widget build(BuildContext context) {
    widget.colorBg ??= Colors.transparent;
    widget.colorShadowTop ??= Colors.black;
    widget.colorShadowMid ??= Colors.black;
    widget.colorShadowBot ??= Colors.black;
    widget.shadowOffset ??= const Offset(0, 5);
    widget.smallYscale ??= 0.3;
    widget.medYscale ??= 0.5;
    widget.bigYscale ??= 0.7;
    widget.smallVisible ??= true;
    widget.medVisible ??= true;
    widget.bigVisible ??= true;
    widget.upsideDown ??= false;

    double smallYoffset = -(widget.screenHeight * (1 - widget.smallYscale!)) / 2 - 5;
    double medYoffset = -(widget.screenHeight * (1 - widget.medYscale!)) / 2 - 5;
    double bigYoffset = -(widget.screenHeight * (1 - widget.bigYscale!)) / 2 - 5;

    //prepare widgets
    Widget big_0_1 = Container();
    Widget big_1_2 = Container();
    Widget big_2_0 = Container();
    Widget med_0_1 = Container();
    Widget med_1_2 = Container();
    Widget med_2_0 = Container();
    Widget small_0_1 = Container();
    Widget small_1_2 = Container();
    Widget small_2_0 = Container();
    if (widget.bigVisible!) {
      big_0_1 = Transform.translate(
        offset: Offset(0, bigYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.bigYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: BigClipper_animated_0_1(progress: _bezierLinesProgress - 0),
            child: Container(
              color: widget.colorBot,
            ),
          ),
        ),
      );
      big_1_2 = Transform.translate(
        offset: Offset(0, bigYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.bigYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: BigClipper_animated_1_2(progress: _bezierLinesProgress - 1),
            child: Container(
              color: widget.colorBot,
            ),
          ),
        ),
      );
      big_2_0 = Transform.translate(
        offset: Offset(0, bigYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.bigYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: BigClipper_animated_2_0(progress: _bezierLinesProgress - 2),
            child: Container(
              color: widget.colorBot,
            ),
          ),
        ),
      );
    }
    if (widget.medVisible!) {
      med_0_1 = Transform.translate(
        offset: Offset(0, medYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.medYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: MedClipper_animated_0_1(progress: _bezierLinesProgress - 0),
            child: Container(
              color: widget.colorMid,
            ),
          ),
        ),
      );
      med_1_2 = Transform.translate(
        offset: Offset(0, medYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.medYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: MedClipper_animated_1_2(progress: _bezierLinesProgress - 1),
            child: Container(
              color: widget.colorMid,
            ),
          ),
        ),
      );
      med_2_0 = Transform.translate(
        offset: Offset(0, medYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.medYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: MedClipper_animated_2_0(progress: _bezierLinesProgress - 2),
            child: Container(
              color: widget.colorMid,
            ),
          ),
        ),
      );
    }
    if (widget.smallVisible!) {
      small_0_1 = Transform.translate(
        offset: Offset(0, smallYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.smallYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: SmallClipper_animated_0_1(progress: _bezierLinesProgress - 0),
            child: Container(
              color: widget.colorTop,
            ),
          ),
        ),
      );
      small_1_2 = Transform.translate(
        offset: Offset(0, smallYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.smallYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: SmallClipper_animated_1_2(progress: _bezierLinesProgress - 1),
            child: Container(
              color: widget.colorTop,
            ),
          ),
        ),
      );
      small_2_0 = Transform.translate(
        offset: Offset(0, smallYoffset),
        child: Transform.scale(
          scaleX: 1.005,
          scaleY: widget.smallYscale,
          child: ClipShadowPath(
            shadow: BoxShadow(
              color: widget.colorShadowBot!,
              offset: widget.shadowOffset!,
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: SmallClipper_animated_2_0(progress: _bezierLinesProgress - 2),
            child: Container(
              color: widget.colorTop,
            ),
          ),
        ),
      );
    }

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationX(widget.upsideDown != null && widget.upsideDown! ? 3.14159 : 0), // Rotate 180 degrees (pi radians)
      child: Scaffold(
        backgroundColor: widget.colorBg,
        body: Stack(
          children: [
            //big
            Visibility(
              visible: 0 <= _bezierLinesProgress && _bezierLinesProgress < 1 && widget.bigVisible!,
              child: big_0_1,
            ),
            Visibility(
              visible: 1 <= _bezierLinesProgress && _bezierLinesProgress < 2 && widget.bigVisible!,
              child: big_1_2,
            ),
            Visibility(
              visible: 2 <= _bezierLinesProgress && _bezierLinesProgress < 3 && widget.bigVisible!,
              child: big_2_0,
            ),
            //med
            Visibility(
              visible: 0 <= _bezierLinesProgress && _bezierLinesProgress < 1 && widget.medVisible!,
              child: med_0_1,
            ),
            Visibility(
              visible: 1 <= _bezierLinesProgress && _bezierLinesProgress < 2 && widget.medVisible!,
              child: med_1_2,
            ),
            Visibility(
              visible: 2 <= _bezierLinesProgress && _bezierLinesProgress < 3 && widget.medVisible!,
              child: med_2_0,
            ),
            //small
            Visibility(
              visible: 0 <= _bezierLinesProgress && _bezierLinesProgress < 1 && widget.smallVisible!,
              child: small_0_1,
            ),
            Visibility(
              visible: 1 <= _bezierLinesProgress && _bezierLinesProgress < 2 && widget.smallVisible!,
              child: small_1_2,
            ),
            Visibility(
              visible: 2 <= _bezierLinesProgress && _bezierLinesProgress < 3 && widget.smallVisible!,
              child: small_2_0,
            ),
          ],
        ),
      ),
    );
  }

  void _startBezierProgressTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      bezierLinesProgressTotalDuration, //total duration (after this single time => onDone())
      bezierLinesProgressTickDuration, //each tick duration (afer each of these times => onData())
    );
    sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _bezierLinesProgress = (_bezierLinesProgress + bezierLinesProgressVelocity) % 3;
      });
    });
  }
}
