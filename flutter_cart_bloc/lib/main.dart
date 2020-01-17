import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'catalog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final _cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    //blocprovider가 bloc을 child에게 전달, blocbuilder -> 어떤 bloc을 받을것인지 선언
    return BlocProvider(create: (BuildContext context) => CartBloc(),
    child: MaterialApp(
      title: 'flutter code sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    ),

    );
//    return BlocProvider(
//      builder: (context) => CartBloc(),
//      child: BlocBuilder(
//          bloc: _cartBloc,
//          builder: (BuildContext context, List state) {
//            return MaterialApp(
//              title: 'Flutter Demo',
//              theme: ThemeData(
//                // This is the theme of your application.
//                //
//                // Try running your application with "flutter run". You'll see the
//                // application has a blue toolbar. Then, without quitting the app, try
//                // changing the primarySwatch below to Colors.green and then invoke
//                // "hot reload" (press "r" in the console where you ran "flutter run",
//                // or simply save your changes to "hot reload" in a Flutter IDE).
//                // Notice that the counter didn't reset back to zero; the application
//                // is not restarted.d
//                primarySwatch: Colors.blue,
//              ),
//              home: LoginScreen(),
//            );
//          }),
//    );






    /*MaterialApp(
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
        // is not restarted.d
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );*/
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Enter'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Catalog())); //MaterialPageRoute해서 뷰 이동시킴
            }),
      ),
    );
  }
}
