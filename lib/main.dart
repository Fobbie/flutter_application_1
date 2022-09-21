// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:async';

import 'package:flutter/material.dart';
////import 'package:flutter/cupertino.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown.shade400,
        appBar: AppBar(
          backgroundColor: Colors.lime.shade700,
          title: Text("My First App"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      LinearProgressIndicator(
                        value: _progressValue,
                        color: Colors.lime.shade700,
                      ),
                      Text(
                        "${(_progressValue * 100).round()}%",
                        style: TextStyle(
                            color: Color.fromARGB(255, 190, 233, 229),
                            fontSize: 20),
                      ),
                    ],
                  )
                : Text(
                    "Press Button to download",
                    style: TextStyle(
                        color: Color.fromARGB(255, 190, 233, 229),
                        fontSize: 30),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          backgroundColor: Colors.lime.shade700,
          child: Icon(Icons.download),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;

        if (_progressValue.toStringAsFixed(1) == "1.0") {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
