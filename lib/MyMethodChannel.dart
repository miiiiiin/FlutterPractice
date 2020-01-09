import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMethodChannel extends StatefulWidget {
  @override
  _MyMethodChannelState createState() => _MyMethodChannelState();
}

class _MyMethodChannelState extends State<MyMethodChannel> {

  static const platform = const MethodChannel('example.com/value'); //메소드를 주고 받을 채널 생

  String _value = 'null';
  Future<void> _getNativeValue() async {
    String value;

    try {
      value = await platform.invokeMethod(
          'getValue'); //값을 얻게 하기 위함, 비동기로 동작하는 future 때문에 await
    } on PlatformException catch  (e) {
      value = '네이티브 코드 실행 에러 : ${e.message}';
    }
    setState(() {
      _value = value; //전역변수 _value 값 변동
    });
  }//비동기로 데이터 받기 위해서 필요함, 값을 내부적으로 변

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Method Channel'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_value'),
            RaisedButton(
                child: Text('네이티브 값 얻기'),
                onPressed: () {
                  _getNativeValue();
                }//_getNativeValue,
            )
          ],
        ),
      ),
    );
  }
}
