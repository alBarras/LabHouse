import 'package:flutter/material.dart';
import 'package:labhouse_albert/code_assets/colors.dart';
import 'package:labhouse_albert/code_assets/strings.dart';
import 'package:labhouse_albert/ui/widgets/animated_up_down_widget.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/model/model_parallax_item.dart';
import 'package:labhouse_albert/ui/widgets/parallax_list/ui/widget_parallax_item.dart';

class ParallaxList extends StatefulWidget {
  final List<ModelParallaxItem> modelParallaxItems;
  final bool hideItems;
  final VoidCallback? quitList;
  Function(ModelParallaxItem modelParallaxItem) pressedOnImage;

  ParallaxList({
    super.key,
    required this.modelParallaxItems,
    required this.hideItems,
    this.quitList,
    required this.pressedOnImage,
  });

  @override
  State<ParallaxList> createState() => _ParallaxListState();
}

class _ParallaxListState extends State<ParallaxList> {
  late ScrollController _scrollViewController;
  bool _alreadyOnListTop = true;
  bool _alreadyScrolledDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(_scrollListener);
  }

  _scrollListener() {
    //not on list's top anymore
    if (_scrollViewController.offset > _scrollViewController.position.minScrollExtent && _alreadyOnListTop) {
      if (!_alreadyScrolledDown) _alreadyScrolledDown = true;
      setState(() {
        _alreadyOnListTop = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollViewController.removeListener(_scrollListener);
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<WidgetParallaxItem> widgetParallaxItems = [];
    int count = -1;
    for (final item in widget.modelParallaxItems) {
      count++;
      widgetParallaxItems.add(
        WidgetParallaxItem(
          numInList: count,
          modelParallaxItem: item,
          hideItem: widget.hideItems,
          pressedOnImage: (modelParallaxItem) {
            widget.pressedOnImage(modelParallaxItem);
          },
        ),
      );
    }
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        //if end of scroll action and at the top of the list
        if (scrollNotification is ScrollEndNotification && _scrollViewController.offset <= _scrollViewController.position.minScrollExtent) {
          if (_alreadyOnListTop) {
            //on list's top and dragged up again so quit list
            if (widget.quitList != null) widget.quitList!();
            setState(() {
              _alreadyOnListTop = false; //make 'Scroll Down to Hide' indicator disappear when quiting
            });
            return false;
          }
          //on list's top
          setState(() {
            _alreadyOnListTop = true;
          });
        }
        return false;
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollViewController,
            child: Column(
              children: widgetParallaxItems,
            ),
          ),
          //Scroll down to hide indicator
          AnimatedOpacity(
            opacity: _alreadyOnListTop && _alreadyScrolledDown ? 1 : 0, //visible when back on top after scrolled down at least once
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Spacer(),
                    //Shadow
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: LIGHT_SHADOW_COLOR,
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      //Text & Arrows
                      child: Row(
                        children: [
                          AnimatedUpDownWidget(
                            animProgressVelocity: 0.003,
                            animProgressLimits: const [-0.5, 0.5],
                            child: const Icon(Icons.keyboard_arrow_down_rounded, color: MAIN_COLOR_WHITE),
                          ),
                          const SizedBox(width: 1),
                          const Text(HIDE_LIST_TEXT, style: TextStyle(color: MAIN_COLOR_WHITE)),
                          const SizedBox(width: 1),
                          AnimatedUpDownWidget(
                            animProgressVelocity: 0.003,
                            animProgressLimits: const [-0.5, 0.5],
                            child: const Icon(Icons.keyboard_arrow_down_rounded, color: MAIN_COLOR_WHITE),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
