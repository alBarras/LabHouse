import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';
import 'package:labhouse_albert/code_assets/durations.dart';
import 'package:labhouse_albert/code_assets/sizes.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/model/model_parallax_item.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/ui/parallax_flow_delegate.dart';
import 'package:labhouse_albert/utils.dart';

class WidgetParallaxItem extends StatefulWidget {
  final int numInList;
  final ModelParallaxItem modelParallaxItem;
  final bool hideItem;
  bool? showDescription;
  Function(ModelParallaxItem modelParallaxItem) pressedOnImage;

  WidgetParallaxItem({
    super.key,
    required this.numInList,
    required this.modelParallaxItem,
    required this.hideItem,
    required this.pressedOnImage,
    this.showDescription,
  });

  @override
  State<WidgetParallaxItem> createState() => _WidgetParallaxItemState();
}

class _WidgetParallaxItemState extends State<WidgetParallaxItem> with SingleTickerProviderStateMixin {
  final GlobalKey _backgroundImageKey = GlobalKey();

  //Sliding animation
  late AnimationController _controllerAnimation;
  late Animation<Offset> _animation;
  //Image Ready
  late ImageProvider _imageProvider;
  late ImageStream _imageStream;
  int _imageIsReady = 0; //is ready at 2, we want the pic to be shown when both loaded and after the PIC_MIN_WAIT_LOADED_DURATION so they all appear at the same time (not if very bad connection, in such case (after the PIC_MIN_WAIT_LOADED_DURATION) as soon a pic is loaded it will be shown)

  @override
  void initState() {
    super.initState();
    //Sliding Animation
    _controllerAnimation = AnimationController(
      duration: PIC_SLIDE_IN_ANIMATION_DURATION,
      vsync: this, //requires the 'with SingleTickerProviderStateMixin' in the class
    );
    Offset initialTranslation = Offset(1.0 - 2 * (widget.numInList % 2), 0.0); //start at the screen's right or left alternately
    Offset finalTranslation = const Offset(0.0, 0.0); //end in the screen's center
    final tween = Tween<Offset>(begin: initialTranslation, end: finalTranslation); //interpolation
    _animation = tween.animate(_controllerAnimation);
    //Image Ready
    _imageProvider = NetworkImage(widget.modelParallaxItem.imageUrl);
    _imageStream = _imageProvider.resolve(ImageConfiguration.empty);
    _imageStream.addListener(
      ImageStreamListener(
        (imageInfo, synchronousCall) {
          _imageIsReady++;
          if (_imageIsReady == 2) _controllerAnimation.forward(); //show pictures
        },
        onError: (exception, stackTrace) {},
      ),
    );
    Future.delayed(PIC_MIN_WAIT_LOADED_DURATION, () {
      _imageIsReady++;
      if (_imageIsReady == 2) _controllerAnimation.forward(); //show pictures
    });
  }

  @override
  void dispose() {
    //Sliding Animation
    _controllerAnimation.dispose();
    //Image Ready
    _imageStream.removeListener(ImageStreamListener((_, __) {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hideItem) {
      _controllerAnimation.reverse(); //hide pictures
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return FractionalTranslation(
          translation: _animation.value,
          child: _buildCard(),
        );
      },
    );
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: () {
          widget.pressedOnImage(
            widget.modelParallaxItem,
          );
        },
        child: AspectRatio(
          aspectRatio: 25 / 9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CARD_RADIUS_SIZE),
              boxShadow: const [
                BoxShadow(
                  color: SHADOW_COLOR,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(5, 5), // Adjust the position of the shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(CARD_RADIUS_SIZE),
              child: Stack(
                children: [
                  _buildParallaxBackground(context),
                  _buildGradient(),
                  _buildNameAndDescription(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(
          widget.modelParallaxItem.imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildNameAndDescription() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Utils.makeFirstCharCapital(widget.modelParallaxItem.name),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Visibility(
            visible: widget.showDescription != null && widget.showDescription! && widget.modelParallaxItem.description != null,
            child: Text(
              widget.modelParallaxItem.description ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
