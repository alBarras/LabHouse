import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class AnimatedUpDownWidget extends StatefulWidget {
  Widget child;
  double? velPerc; //[0,1] = [no movement, full velocity], when no movement the child will be on the center
  double? animProgressVelocity; //speed in which the animated child move
  List<double>? animProgressLimits; //[-1,1] will do the entire movement
  AnimatedUpDownWidget({Key? key, required this.child, this.velPerc, this.animProgressVelocity, this.animProgressLimits}) : super(key: key);

  @override
  _AnimatedUpDownWidget createState() => _AnimatedUpDownWidget();
}

class _AnimatedUpDownWidget extends State<AnimatedUpDownWidget> {
  var sub;
  Duration animProgressTickDuration = const Duration(milliseconds: 1); //how often the screen refreshes
  Duration animProgressTotalDuration = const Duration(days: 365); // we want it to be infinity, but 1 year seems fair enough
  bool movingDown = true;
  double animPogress = 0; //from widget.animProgressLimits[0] to widget.animProgressLimits[1]

  @override
  void initState() {
    _startAnimationTimer();
  }

  @override
  void dispose() {
    super.dispose();
    sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    widget.animProgressLimits ??= [-1, 1];
    widget.animProgressVelocity ?? 0.05;
    return _animatedScrollTextWidget();
  }

  _animatedScrollTextWidget() {
    return Container(
      transform: Transform.translate(offset: Offset(0, 5 * animPogress * (widget.velPerc ?? 1))).transform,
      child: widget.child,
    );
  }

  // --- ANIMATION TIMER ---

  void _startAnimationTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      animProgressTotalDuration, //total duration (after this single time => onDone())
      animProgressTickDuration, //each tick duration (afer each of these times => onData())
    );
    sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (movingDown) {
        animPogress -= widget.animProgressVelocity!;
        if (animPogress <= widget.animProgressLimits![0]) {
          movingDown = false;
          animPogress = widget.animProgressLimits![0];
        }
      } else {
        animPogress += widget.animProgressVelocity!;
        if (widget.animProgressLimits![1] <= animPogress) {
          movingDown = true;
          animPogress = widget.animProgressLimits![1];
        }
      }
      setState(() {});
    });
  }
}
