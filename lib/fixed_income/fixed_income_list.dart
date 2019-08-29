import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renda_fixa/fixed_income/fixed_income.dart';
import 'package:renda_fixa/fixed_income/fixed_income_bloc.dart';

class FixerIncomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Renda Fixa")),
      body: FutureBuilder<List<FixedIncome>>(
        future: FixedIncomeBLoc().getFixedIncomeListFromJSON(),
        initialData: new List<FixedIncome>(),
        builder: (BuildContext context, snapshot) {
          return Container();
        },
      ),
    );
  }
}
