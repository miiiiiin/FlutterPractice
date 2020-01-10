import 'package:rxdart/rxdart.dart';

class CounterBloc {

  int _count = 0;

  final _countSubject = BehaviorSubject.seeded(0);//BehaviorSubject<int>();
  //어떠한 결과값을 담아둘 수 있음, 마지막에 넣은것만 계속 반환함
  //최초에 아무 값도 갖고 있지 않음. 생성자에 seed value를 넣어야함

  void addCounter() {
    _count ++;
    _countSubject.add(_count); //마지막 카운트 값이 담기도록
  }

  //getter 정의
  //$를 붙여서 stream이라는 것 표시, ex) count의 stream
   Stream<int> get count$ => _countSubject.stream; //count stream을 외부에서 달라고 하면 countsubject의 stream을 줌.
}//값과 로직을 옮길 수 있음. 스트림을 이용해 관찰하도록 설정