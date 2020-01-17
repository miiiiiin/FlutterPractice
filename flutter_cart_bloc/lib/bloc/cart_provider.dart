import 'package:flutter/cupertino.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';

//inherted widget을 상속하면 하위 위젯들에게 계속 제공할 수 있게 만들 수 있음
class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider(
      { //외부에서 지정하지 않는 생성자
      Key key, //모든 위젯의 유니크한 값
      CartBloc cartBloc,
      Widget child //위젯을 설정할 수 있는 child
      })
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child); //위의 값이 cartbloc이 들어감
  //프로바이더 안의 cartBloc이 null이면 생성해서 넣어버
  //CartBloc class를 내부에서 강제로 생성해 버림
  //이외의 나머지는 super에서는 inherted widget의 생성자를 호출하게 함

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CartBloc of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType(aspect: CartProvider) as CartProvider).cartBloc; //타입 체크
}
