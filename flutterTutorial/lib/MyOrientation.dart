import 'package:flutter/material.dart';

class MyOrientation extends StatefulWidget {
  @override
  _MyOrientationState createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Orientation Builder'),
        ),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) { //orientation으로 조건 줘서 화면회줜할때마다 count값 수정 가능
            return GridView.count(
                crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
//        children: <Widget>[
//          Center(child: Text('item 1')),
//          Center(child: Text('item 1')),
//          Center(child: Text('item 1')),
//          Center(child: Text('item 1')),
//          Center(child: Text('item 1')),
//        ],
                children: List.generate(50, (position) {
                  return Center(
                    child: Text('item $position'),
                  ); //item 0~49번 까지 생성
                }));
        }, //빌더, 오리엔테이션 함수 정
        )
    ); //3열로 그리드 뷰 생성의
  }
}
