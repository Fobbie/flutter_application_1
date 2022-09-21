// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
////import 'package:flutter/cupertino.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test Assets"),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/bg.jfif"),
              ),
              Image.asset(
                "assets/icons/icon.png",
                scale: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
