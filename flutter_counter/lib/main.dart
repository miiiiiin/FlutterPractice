import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: Counter(),
      )
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  final counterSubject = BehaviorSubject<int>(); //rxdart에서 어떠한 값들을 계속적으로 추가, 마지막 값을 얻게 해줌. stream 지원
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('add'),
            onPressed: () {
              setState(() {
                counterSubject.add(++counter); //add된 값을 subject로 보내줌
              });
            },

          ),
          StreamBuilder<int>(
            stream: counterSubject.stream,//countersubject에 들어간 값들이 스트림 형태로 값이 연동
              initialData: 0,//초기값 설
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('${snapshot.data}', style: TextStyle(fontSize: 30),
                );
              }
            }
          )
        ],
      ),
    );
  }
}
