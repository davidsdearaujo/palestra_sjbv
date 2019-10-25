import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

class LikeButton extends StatefulWidget {
  final Size size;

  const LikeButton({Key key, this.size = Fluttie.kDefaultSize})
      : super(key: key);
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  FluttieAnimationController controller;
  bool isLiked = false;
  StreamSubscription _subscription;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    if (_subscription != null) {
      _subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  void initAnimation() async {
    var instance = Fluttie();
    var composition =
        await instance.loadAnimationFromAsset("assets/10499-thumb-up.json");
    controller = await instance.prepareAnimation(
      composition,
      duration: Duration(seconds: 2),
    );
    setState(() {});
  }

  void toggle() {
    isLiked = !isLiked;
    if (isLiked) {
      controller.start();
      _subscription = Future.delayed(Duration(milliseconds: 1500))
          .asStream()
          .listen((_) => controller.pause());
    } else {
      _subscription.cancel();
      controller.stopAndReset(rewind: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: FluttieAnimation(
        controller,
        size: widget.size,
      ),
    );
  }
}
