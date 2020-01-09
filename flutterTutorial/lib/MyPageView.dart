import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
//    return PageView(
//      children: <Widget>[
//        Container(
//          color: Colors.red,
//        ),
//        Container(
//          color: Colors.green,
//        ),
//        Container(
//          color: Colors.blue,
//        )
//      ],
//    );
      return MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.directions_bus)),
                  Tab(icon: Icon(Icons.directions_bike)),
                  Tab(icon: Icon(Icons.directions_railway)),
                ],
              ),
            ),
            body: TabBarView(
              children: < Widget>[
                Icon(Icons.directions_bus),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_railway)
              ],
            ),
          ),
        ),
      );
  }
}
