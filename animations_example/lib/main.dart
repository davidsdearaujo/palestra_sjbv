import 'package:flutter/material.dart';

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
  bool state = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation Example")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            state = !state;
          });
        },
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              state = !state;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: state ? 50 : 150,
            height: state ? 50 : 150,
            color: state ? Colors.blue : Colors.green,
          ),
        ),
      ),
    );
  }
}
