import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:renda_fixa/fixed_income/fixed_income.dart';

class FixedIncomeBLoc {
  final String url =
      'https://my-json-server.typicode.com/miltonmartins/demo/db';

  factory FixedIncomeBLoc() => instance;

  @visibleForTesting
  static var instance = FixedIncomeBLoc._internal();

  FixedIncomeBLoc._internal();

  Future<List<FixedIncome>> getFixedIncomeListFromJSON() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var fixedIncomeListJson = jsonResponse['fundos_arr'];

      return List<FixedIncome>.from(
          fixedIncomeListJson.map((item) => FixedIncome.fromJson(item)));
    } else {
      throw ("Request failed with status: ${response.statusCode}.");
    }
  }
}
