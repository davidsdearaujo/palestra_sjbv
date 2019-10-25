import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

class LoveButton extends StatefulWidget {
  final Size size;

  const LoveButton({
    Key key,
    this.size = Fluttie.kDefaultSize,
  }) : super(key: key);

  @override
  _LoveButtonState createState() => _LoveButtonState();
}

class _LoveButtonState extends State<LoveButton> {
  FluttieAnimationController controller;
  bool isLiked = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  void initAnimation() async {
    var instance = Fluttie();
    var composition = await instance.loadAnimationFromAsset("assets/10475-drawing-a-love.json");
    controller = await instance.prepareAnimation(
      composition,
      duration: Duration(milliseconds: 1500),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isLiked = !isLiked;
        if (isLiked) {
          controller.start();
        } else {
          controller.stopAndReset(rewind: true);
        }
      },
      child: FluttieAnimation(
        controller,
        size: widget.size,
      ),
    );
  }
}
