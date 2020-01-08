import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SnackBar'),
        ),
        body: Builder(
            builder: (context) => Center(
                  //Builder를 이용해 새로운 context 생성 -> 그 안에 화면 생성 가능
                  child: RaisedButton(
                    onPressed: () {
                      //snackbar는 content가 필요
                      final snackBar = SnackBar(
                        content: Text('메일이 삭제되었습니다.'),
                        action: SnackBarAction(
                            label: '취소',
                            onPressed: () {
                              //눌렀을 때 처리
                            }),
                      );

                      Scaffold.of(context).showSnackBar(
                          snackBar); //같은 context 내에서 Scaffold 이중 사용 불가능, builder로 context 생성해줘야함
                    },
                    child: Text('show snackbar'),
                  ),
                )));
  }
}
