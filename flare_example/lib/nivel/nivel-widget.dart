import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'nivel-controller.dart';

class NivelWidget extends StatefulWidget {
  final Duration duration;
  final Duration delay;
  final double value;

  const NivelWidget({Key key, this.duration, this.value, this.delay})
      : super(key: key);
  @override
  _NivelWidgetState createState() => _NivelWidgetState();
}

class _NivelWidgetState extends State<NivelWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  NivelController _flrController;

  @override
  void initState() {
    super.initState();
    _flrController = NivelController(animationName: "0to100");

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: widget.value / 100).animate(
      CurvedAnimation(
        curve: Curves.ease,
        parent: _controller,
      ),
    );

    _animation.addListener(() {
      _flrController.value = _animation.value;
    });
    Future.delayed(
      widget.delay ?? Duration(milliseconds: 100),
      _controller.forward,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      "assets/gradient_progress_bar.flr",
      controller: _flrController,
      fit: BoxFit.contain,
    );
  }
}
