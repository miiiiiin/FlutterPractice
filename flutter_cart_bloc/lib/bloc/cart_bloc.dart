import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../item.dart';
import 'package:rxdart/rxdart.dart';

//event 기반 사용 패턴

enum CartEventType {
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}//어떤 아Í이템을 추가, 삭제 하였는지Í

class CartBloc {

  final itemList = [
    Item('맥북', 2000000),
    Item('아이패드', 350000),
    Item('에어팟', 200000),
    Item('아이맥', 3000000),
    Item('아이폰', 9800000),
  ];

  final _cartList = List<Item>(); //빈 리스트 선언

  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]); //behavior subject 생성

  Stream<List<Item>> get cartList  => _cartListSubject.stream; //외부에서 cartlist르 요청하면 서브젝트의 스트림을 방출하도록 설정

  void add(CartEvent event) {
    switch (event.type) {
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;

      case CartEventType.add:
        _cartList.add(event.item);
        break;
    }
    
    _cartListSubject.add(_cartList);
    //cartlist에 계속 누적, cartListsubject로 들어가서 Stream으로 빠져나가는 흐름
  }
}