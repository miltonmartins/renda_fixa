import 'package:flutter/cupertino.dart';

class FixedIncome {
  String name;
  String details;

  FixedIncome({this.name});

  factory FixedIncome.fromJson(Map<String, dynamic> json) {
    return FixedIncome(
      name: json['name'],
    );
  }
}
