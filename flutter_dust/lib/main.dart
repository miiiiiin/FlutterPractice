import 'package:flutter/material.dart';
import 'package:flutter_dust/bloc/air_bloc.dart';

import 'models/air_result.dart';

void main() => runApp(MyApp());

final airBloc = AirBloc(); //bloc 객

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Main());
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
//  AirResult _result;
//
//  @override
//  void initState() {
//    //초기 수행되는 부
//    super.initState();
//    fetchData().then((airResult) {
//      setState(() {
//        //데이터 받아서 화면 갱신
//        _result = airResult;
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: StreamBuilder<AirResult>(
          stream: airBloc.airResult,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildPadding(snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          }),
    ));
  }

  Padding buildPadding(AirResult result) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '현재 위치 미세먼지',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, //스페이싱
                      children: <Widget>[
                        Text('얼굴사진'),
                        Text(
                          '${_result.data.current.pollution.aqicn}',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          getString(_result),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    color: getColor(_result),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.network(
                              'https://airvisual.com/images/${_result.data.current.weather.ic}.png',
                              width: 32,
                              height: 32,
                            ), //통신 이미지 적용
                            SizedBox(
                              width: 16,
                            ), //여백효
                            Text(
                              '${result.data.current.weather.tp}°',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Text('습도 ${result.data.current.weather.hu}%'),
                        Text('풍속 ${result.data.current.weather.ws}m/s'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: RaisedButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                color: Colors.orange,
                onPressed: () {},
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getColor(AirResult result) {
    if (result.data.current.pollution.aqius < 50) {
      return Colors.greenAccent;
    } else if (result.data.current.pollution.aqius < 100) {
      return Colors.yellow;
    } else if (result.data.current.pollution.aqius < 150) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getString(AirResult result) {
    if (result.data.current.pollution.aqius < 50) {
      return '좋음';
    } else if (result.data.current.pollution.aqius < 100) {
      return '보통';
    } else if (result.data.current.pollution.aqius < 150) {
      return '나쁨';
    } else {
      return '최악';
    }
  }
}
