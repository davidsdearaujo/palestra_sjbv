import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Example4 extends StatefulWidget {
  @override
  _Example4State createState() => _Example4State();
}

class _Example4State extends State<Example4> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ham to Close")),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tap Here"),
            Icon(Icons.keyboard_arrow_down, size: 25),
            Container(
              width: 100,
              height: 100,
              child: GestureDetector(
                onTap: () => setState(() {
                  isOpen = !isOpen;
                }),
                child: FlareActor(
                  "assets/Ham2Close.flr",
                  color: Theme.of(context).primaryColor,
                  animation: isOpen ? "To Close" : "To Ham",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
