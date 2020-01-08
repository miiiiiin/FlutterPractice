import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {

  double _width = 59;
  double _height = 50;

  Color _color = Colors.green;
  BorderRadius _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated container'),
      ),

      body: Center(
        child: AnimatedContainer(
            width: _width,
            height: _height ,
            decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
        ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            setState(() {
              final random = Random();
              _height = random.nextInt(300).toDouble();
              _width = random.nextInt(300).toDouble();
              _color = Color.fromRGBO(
                  random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
              _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
            });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

