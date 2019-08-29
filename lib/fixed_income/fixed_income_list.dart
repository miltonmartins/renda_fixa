import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renda_fixa/fixed_income/fixed_income.dart';
import 'package:renda_fixa/fixed_income/fixed_income_bloc.dart';

import 'fixed_income_item.dart';

class FixedIncomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Renda Fixa")),
      body: FutureBuilder<List<FixedIncome>>(
        future: FixedIncomeBLoc().getFixedIncomeListFromJSON(),
        initialData: new List<FixedIncome>(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) => FixedIncomeItem(
                      fixedIncome: snapshot.data[index],
                    ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
