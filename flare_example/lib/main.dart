import 'package:flutter/material.dart';

import 'examples/example1.dart';
import 'examples/example2.dart';
import 'examples/example3.dart';
import 'examples/example4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animações Flare"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("Example 4 - Animação simples (Ham to Close)"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Example4(),
              );
            },
          ),
          ListTile(
            title: Text("Example 1 - Animação automática com valor inicial"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Example1(),
              );
            },
          ),
          ListTile(
            title: Text("Example 2 - Animação com slider controlando o tempo"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Example2(),
              );
            },
          ),
          ListTile(
            title: Text("Example 3 - Animação com slider invisível"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Example3(),
              );
            },
          ),
        ],
      ),
    );
  }
}
