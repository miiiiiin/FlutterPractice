import 'package:flutter/material.dart';

import 'bloc/counter_bloc.dart';

void main() => runApp(MyApp());

final counterBloc = CounterBloc(); //전체 앱에서 bloc 사용 가능

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample code'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: counterBloc.count$, //이 스트림으로 부터 값을 받을 예정(어디서 받을지 설정 가)
            builder: (context, snapshot) { //context와 snashot이라는 두개의 파라미터를 받음
          if (snapshot.hasData) {
            return Text('${snapshot.data}', style: TextStyle(fontSize: 30),);
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height:  50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          counterBloc.addCounter(); //counter bloc의 함수 실행
        }),
        tooltip: 'increment counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
