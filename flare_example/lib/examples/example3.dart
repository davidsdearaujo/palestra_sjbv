import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../nivel/nivel-controller.dart';

class Example3 extends StatefulWidget {
  @override
  _Example3State createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  double sliderValue = 0;
  NivelController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NivelController(animationName: "0to100");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animação com slider invisível")),
      body: Container(
        padding: EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: FlareActor(
                "assets/gradient_progress_bar.flr",
                controller: _controller,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 50,
              child: Slider(
                min: 0,
                max: 1,
                inactiveColor: Colors.transparent,
                activeColor: Colors.transparent,
                // divisions: 50,
                onChanged: (double value) {
                  // setState() causes the widget to refresh its visual appearance
                  setState(() {
                    // When the value of the slider changes, the setter
                    // is invoked, which triggers an animation swap.
                    _controller.value = value;
                    sliderValue = value;
                  });
                },
                value: sliderValue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
