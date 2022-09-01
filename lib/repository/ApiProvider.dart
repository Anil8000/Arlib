// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable, unnecessary_null_comparison

import 'dart:convert';

import 'package:arlib_project/utils/AppCommonFunction.dart';
import 'package:http/http.dart' as http;

import '../model/DiseaseResponse.dart';

class ApiProvider {
  Future<DiseaseResponse?> getDiseaseApi() async {
    try {
      DiseaseResponse diseaseResponse;
      http.Response response = await http
          .get(
            Uri.parse("https://run.mocky.io/v3/ff784728-c480-4ad2-b7f3-2d5a5d1e7f0b"),
          )
          .timeout(Duration(seconds: 20));

      printWrapped("RESPONSE  ::  ${response.body}");

      if (response.statusCode == 200) {
        if (response.body != null) {
          diseaseResponse = DiseaseResponse.fromJson(json.decode(response.body));
          return diseaseResponse;
        }
      }
    } catch (e) {
      print("Exception Bloc  ::  $e");
      throw Exception("Something went wrong");
    }
  }
}
