import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //.only()도 가능, 사방의 패딩값을 0으로 초기화
          children: <Widget>[
            DrawerHeader(
              child: Text('header'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text('item 1'),
              onTap: () {
                // TO DO
                Navigator.pop(context); //drawer 열렸을때 닫기
              },
            ),
            ListTile(
              title: Text('item 2'),
                onTap: () {
                  // TO DO
                  Navigator.pop(context); //drawer 열렸을때 닫기
                }
            ),
            ListTile(
              title: Text('item 3'),
                onTap: () {
                  // TO DO
                  Navigator.pop(context); //drawer 열렸을때 닫기
                }
            ),
            ListTile(
              title: Text('item 4'),
                onTap: () {
                  // TO DO
                  Navigator.pop(context); //drawer 열렸을때 닫기
                }
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      body: Center(
        child: Text('Drawer Practice'),
      ));
  }
}
