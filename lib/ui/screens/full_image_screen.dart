import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';
import 'package:labhouse_albert/code_assets/sizes.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/model/model_parallax_item.dart';
import 'package:labhouse_albert/utils.dart';

class FullImageScreen extends StatefulWidget {
  ModelParallaxItem? item;
  VoidCallback close;
  AnimationController animationController;
  double screenWidth;

  FullImageScreen({
    Key? key,
    required this.item,
    required this.close,
    required this.animationController,
    required this.screenWidth,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FullImageScreen();
  }
}

class _FullImageScreen extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildFullImageScreenContent();
  }

  Widget _buildFullImageScreenContent() {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: widget.animationController.value,
          child: Stack(
            children: [
              //Close full image if tapped on background
              InkWell(
                child: Container(color: WHITE_SHADOW_BACKGROUND),
                onTap: () {
                  widget.close();
                },
              ),
              //Centered with shadow Container
              Center(
                child: Container(
                  margin: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(CARD_RADIUS_SIZE),
                    boxShadow: const [
                      BoxShadow(
                        color: SHADOW_COLOR,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  //Rounded Image
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(CARD_RADIUS_SIZE),
                    child: Stack(
                      children: [
                        Image.network(
                          widget.item != null ? widget.item!.imageUrl : "",
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
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
                        ),
                        //Texts
                        Positioned(
                          left: 20,
                          bottom: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Title Text
                              SizedBox(
                                width: widget.screenWidth * 0.8,
                                child: Text(
                                  Utils.makeFirstCharCapital(widget.item != null ? widget.item!.name : ""),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //Description Text
                              Visibility(
                                visible: widget.item != null && widget.item!.description != null && widget.item!.description!.isNotEmpty,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: widget.screenWidth * 0.8,
                                      child: Text(
                                        widget.item!.description != null ? Utils.makeFirstCharCapital(widget.item!.description!) : "",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        //Close Button
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                child: const Icon(
                                  Icons.cancel_rounded,
                                  color: MAIN_COLOR_WHITE,
                                  shadows: [
                                    BoxShadow(
                                      color: SHADOW_COLOR,
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  widget.close();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
