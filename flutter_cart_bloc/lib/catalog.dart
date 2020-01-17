import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/cart.dart';
import 'package:flutter_cart_bloc/main.dart';

import 'bloc/cart_bloc.dart';
import 'item.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
//  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
//    final _cartBloc = BlocProvider.of<CartBloc>(context); //상위에서 내려오는 bloc. <CartBloc> 타입 형 설정

    return Scaffold(
        appBar: AppBar(
          title: Text('Catalog'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.archive),
              onPressed: () {
                //화면전환
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_ /*context*/) => Cart()));
              },
            )
          ],
        ),
        body: StreamBuilder(
            stream: cartBloc.cartList,
            //cartBloc main에서 import, cartlist라는 스트림을 가져옴
            builder: (context, snapshot) {
              return ListView(
                children: cartBloc.itemList
                    .map((item) => _buildItem(item, snapshot.data))
                    .toList(),
              );
            }));
  }

  Widget _buildItem(Item item, List<Item> state) {
    //item 하나씩 받아서 listview에 사용되는 listtile의 패딩값을 리턴

    //현재 상태가 체크되었는지 안되었는지 확인
    final isChecked = state.contains(item);

    return Padding(
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 30.0),
        ),
        subtitle: Text('${item.price}' //string 형태로 변환
            ),
        trailing: IconButton(
            icon: isChecked
                ? Icon(Icons.check, color: Colors.red)
                : Icon(Icons.check),
            onPressed: () {
              if (isChecked) {
                cartBloc.add(CartEvent(CartEventType.remove, item));
              } else {
                cartBloc.add(CartEvent(CartEventType.add, item));
              }
            }), //오른쪽 끝에 위치 수 있는 설정
      ),
      padding: const EdgeInsets.all(8.0)
    );
  }
}
