import 'package:flutter/material.dart';
import 'package:flutter_practice/MyAnimatedOpacity.dart';
import 'package:flutter_practice/MyAnimatorContinaer.dart';
import 'package:flutter_practice/MyDrawer.dart';
import 'package:flutter_practice/MyFormValidation.dart';
import 'package:flutter_practice/MyMethodChannel.dart';
import 'package:flutter_practice/MyOrientation.dart';
import 'package:flutter_practice/MySnackBar.dart';
import 'package:flutter_practice/MySwipeToDismiss.dart';
import 'package:flutter_practice/MyTabController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.dark, //다크모드
        primarySwatch: Colors.blue,
        accentColor: Colors.yellow
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter tutorial'),
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile (
          title: Text('Animated Container'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyAnimatedContainer()));
          },
        ),
        ListTile (
          title: Text('Animated Opacity'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MyAnimatedOpacity()));
          },
        ),
        ListTile (
          title: Text('Drawer'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MyDrawer()));
          },
        ),
        ListTile (
          title: Text('SnackBar'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MySnackBar()));
          },
        ),
        ListTile (
          title: Text('Orientation'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MyOrientation()));
          },
        ),
        ListTile (
          title: Text('Tab Controller'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MyTabController()));
          },
        ),
        ListTile (
          title: Text('Form Validation'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MyFormValidation()));
          },
        ),
        ListTile (
          title: Text('Swipe'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MySwipeToDismiss()));
          },
        ),
        ListTile (
          title: Text('Method Channel'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MyMethodChannel()));
          },
        ),
      ],
    );
  }
}
