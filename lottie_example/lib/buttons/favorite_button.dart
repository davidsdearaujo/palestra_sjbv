import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

class FavoriteButton extends StatefulWidget {
  final Size size;

  const FavoriteButton({Key key, this.size = Fluttie.kDefaultSize})
      : super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
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
        await instance.loadAnimationFromAsset("assets/257-favorie.json");
    controller = await instance.prepareAnimation(
      composition,
      duration: Duration(seconds: 3),
    );
    setState(() {});
  }

  void toggle() {
    isLiked = !isLiked;
    if (isLiked) {
      controller.start();
      _subscription = Future.delayed(Duration(milliseconds: 2500))
          .asStream()
          .listen((_) => controller.pause());
    } else {
      controller.start();
      Future.delayed(Duration(milliseconds: 700))
          .asStream()
          .listen((_) => controller.stopAndReset(rewind: true));
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
