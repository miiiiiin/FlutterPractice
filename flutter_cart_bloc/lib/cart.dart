import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/item.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, List<Item>> (
        bloc: BlocProvider.of<CartBloc>(context),
        builder: (BuildContext contest, List state) { //Buildcontext와 List 상태가 넘어옴, 상태에 아이템들이 들어옴
          var sum = 0;

          if (state.length > 0) {
            sum = state.map((item) => item.price).reduce((x, y) => x + y);
            //reduce는 x, y와 같은 타입을 리턴
          }

          return Center(
            child: Text('합계 : $sum',
            style: TextStyle(fontSize: 30),)

          );
        },
      ),
    );
  }
}
