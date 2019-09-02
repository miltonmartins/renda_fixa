import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renda_fixa/common/refresh_button.dart';
import 'package:renda_fixa/fixed_income/fixed_income.dart';
import 'package:renda_fixa/fixed_income/fixed_income_bloc.dart';
import 'package:renda_fixa/localization/app_localization.dart';

import 'fixed_income_item.dart';

class FixedIncomeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FixedIncomeListState();
}

class FixedIncomeListState extends State<FixedIncomeList> {
  Future<List<FixedIncome>> listOfFixedIncome =
      FixedIncomeBLoc().getFixedIncomeListFromJSON();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Renda Fixa")),
      body: FutureBuilder<List<FixedIncome>>(
        future: listOfFixedIncome,
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return RefreshButton(
                    error: AppLocalizations.of(context).connectionFailed,
                    onPressed: setFixedIncomeList);
              }

              return new RefreshIndicator(
                  onRefresh: () {
                    setFixedIncomeList();
                    return Future(() => null);
                  },
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, index) =>
                          FixedIncomeItem(
                            fixedIncome: snapshot.data[index],
                          )));
              break;
            default:
              return null;
          }
        },
      ),
    );
  }

  void setFixedIncomeList() {
    setState(() {
      listOfFixedIncome = refreshList();
    });
  }

  Future<List<FixedIncome>> refreshList() async =>
      await FixedIncomeBLoc().getFixedIncomeListFromJSON();
}
