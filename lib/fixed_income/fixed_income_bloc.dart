import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:renda_fixa/fixed_income/fixed_income.dart';
import 'package:renda_fixa/localization/app_localization.dart';

class FixedIncomeBLoc {
  static const String urlList =
      'https://my-json-server.typicode.com/miltonmartins/demo/db';
  static const String urlDetails =
      'https://my-json-server.typicode.com/miltonmartins/demo';

  factory FixedIncomeBLoc() => instance;

  @visibleForTesting
  static var instance = FixedIncomeBLoc._internal();

  FixedIncomeBLoc._internal();

  Future<List<FixedIncome>> getFixedIncomeListFromJSON() async {
    var response = await http.get(urlList);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var fixedIncomeListJson = jsonResponse['fundos_arr'];

      return List<FixedIncome>.from(
          fixedIncomeListJson.map((item) => FixedIncome.fromJson(item)));
    } else {
      throw ("Request failed with status: ${response.statusCode}.");
    }
  }

  Future<String> getFixedIncomeDetails(String cnpj) async {
    var response =
        await http.get('$urlDetails/${cnpj.replaceAll(new RegExp(r'[^\w\s]+'), '')}');

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse['details'];
    } else {
      throw ("Request failed with status: ${response.statusCode}.");
    }
  }
}
