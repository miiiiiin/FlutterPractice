import 'package:flutter/material.dart';

class MyTabController extends StatefulWidget {
  @override
  _MyTabControllerState createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Controller'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.access_alarm), text: 'TAB1'),
              Text('TAB2'),
              Text('TAB3'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.alarm), //기본 center 설정
            Center(child: Text('TAB2')),
            Center(child: Text('TAB1')),
          ],
        ),
      ),
      length: 3,
    );
  }
}
