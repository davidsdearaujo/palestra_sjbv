import 'package:flutter/material.dart';

import '../nivel/nivel-widget.dart';

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animação automática com valor inicial")),
      body: Container(
        padding: EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Container(
          height: 50,
          child: NivelWidget(
            value: 50,
            delay: Duration(milliseconds: 800),
          ),
        ),
      ),
    );
  }
}
