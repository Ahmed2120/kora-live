import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yalla_shot/widget/fixture.dart';

import '../http_exception.dart';

class SoccerApi{
  final String url = 'https://v3.football.api-sports.io/fixtures?live=all';
  final Map<String, String> headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "aab4fb5576fc66152479cf7be18d2ef0"
  };

  Future<List> getFixtures() async{
    try{
    final res = await http.get(Uri.parse(url), headers: headers);
    print('fixtures: ${res.statusCode}');
    if(res.statusCode == 200) {
      final responseData = json.decode(res.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      List<dynamic> fixturesMap = responseData['response'];
      List<SoccerMatch> fixtures = fixturesMap.map((dynamic e) => SoccerMatch.fromJson(e)).toList();
      print('fixtures: ${fixtures.length}');
      return fixtures;
    }else{
      print('fixtures: ${res.statusCode}');
      return [];
    }
    }catch(e){
      rethrow;
    }
  }
}