// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_dust/models/AirResult.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_dust/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  test('http 테스트', () async {
    var response = await http.get('https://api.airvisual.com/v2/nearest_city?key=6f409f35-a826-428a-80fa-3974eb9c00a9');

    expect(response.statusCode, 200);

    AirResult result = AirResult.fromJson(json.decode(response.body)); //json 스트링을 json형태로 디코딩하여 넘김
    expect((result.status), 'success');
  });
}
