import 'package:flutter/material.dart';

import 'item.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[IconButton(
          icon: Icon(Icons.archive),
          onPressed: () {
            //
          },
        )],
      ),
     body: ListView(
       children: _itemList
           .map((item) => _buildItem(item)),
       //map 안에는 item하나씩 들어오고 형 변환시킴 -> buildItem 함수 타서 padding이 있는 listTile로 변환시킴
     ),
    );
  }

  Widget _buildItem(Item item) { //item 하나씩 받아서 listview에 사용되는 listtile의 패딩값을 리턴
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(item.title, style: TextStyle(fontSize: 30.0),),
      ),
    );
  }
}
