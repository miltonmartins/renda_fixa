import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renda_fixa/common/refresh_button.dart';
import 'package:renda_fixa/localization/app_localization.dart';

import 'fixed_income_bloc.dart';

class FixedIncomeDetails extends StatefulWidget {
  final String cnpj;

  FixedIncomeDetails({@required this.cnpj});

  @override
  State<StatefulWidget> createState() {
    return FixedIncomeDetailsState();
  }
}

class FixedIncomeDetailsState extends State<FixedIncomeDetails> {
  Future<String> details;

  @override
  void initState() {
    details = FixedIncomeBLoc().getFixedIncomeDetails(widget.cnpj);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.cnpj)),
      body: FutureBuilder(
          future: details,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                child: Text(snapshot.data, textAlign: TextAlign.justify),
                padding: EdgeInsets.all(10.0),
              );
            } else if (snapshot.hasError) {
              return RefreshButton(
                error: AppLocalizations.of(context).connectionFailed,
                onPressed: refreshPage,
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  void refreshPage() {
    setState(() {
      details = FixedIncomeBLoc().getFixedIncomeDetails(widget.cnpj);
    });
  }
}
