import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'catalog.dart';

void main() => runApp(MyApp());


final cartBloc = CartBloc();


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //blocprovider가 bloc을 child에게 전달, blocbuilder -> 어떤 bloc을 받을것인지 선언
    return MaterialApp(
      title: 'flutter code sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
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
