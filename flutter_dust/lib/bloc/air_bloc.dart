
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dust/models/air_result.dart';
import 'package:rxdart/rxdart.dart';


class AirBloc {

  final _airSubject = BehaviorSubject<AirResult>();


  AirBloc() {
    fetch();
  }//생성

  void fetch() async {
    var airResult = await fetchData();
    _airSubject.add(airResult);
  }//마지막 airresult가 비동기로 들어가게됨


  //getter 정의
  Stream<AirResult> get airResult => _airSubject.stream;


  Future<AirResult> fetchData() async {
    var response = await http.get(
        'https://api.airvisual.com/v2/nearest_city?key=6f409f35-a826-428a-80fa-3974eb9c00a9');

    AirResult result = AirResult.fromJson(json.decode(response.body));
    return result;
  }
}