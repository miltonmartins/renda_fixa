import 'package:flutter/material.dart';

import 'fixed_income/fixed_income_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: FixedIncomeList(),
    );
  }
}
