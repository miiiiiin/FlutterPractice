import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../item.dart';
//event 기반 사용 패턴

enum CartEventType {
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}//어떤 아Í이템을 추가, 삭제 하였는지Í

class CartBloc extends Bloc<CartEvent, List<Item>> {

  List<Item> items = [];

  @override
  List<Item> get initialState => [];

  @override
  Stream<List<Item>> mapEventToState(CartEvent event) async* {
    switch(event.type) {
      case CartEventType.add:
        items.add(event.item);
        break;

      case CartEventType.remove:
        items.remove(event.item);
        break;
    }
    yield items; //async*과 yield를 쓰면 stream 형태로 계속 방출하는 것을 만드는 걸 선언한다는 의미
    //yield는 async*로 만든 스트림을 리턴해서 데이터를 하나씩 전달해주는 역할
    //return null;
  }
}