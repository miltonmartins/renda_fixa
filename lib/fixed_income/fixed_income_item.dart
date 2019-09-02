import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renda_fixa/fixed_income/fixed_income.dart';
import 'package:renda_fixa/fixed_income/fixed_income_details.dart';
import 'package:renda_fixa/fixed_income/fixed_income_profile.dart';
import 'package:renda_fixa/localization/app_localization.dart';

class FixedIncomeItem extends StatelessWidget {
  final FixedIncome fixedIncome;

  FixedIncomeItem({@required this.fixedIncome});

  static const TextStyle infoStyle =
      TextStyle(color: Colors.black87, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    EdgeInsets padding =
        EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15);

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FixedIncomeDetails(cnpj: fixedIncome.cnpj)),
      ),
      child: Card(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 10),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(screenSize),
            _buildHeader(context, padding),
            Divider(height: 2.0, color: Colors.black),
            _buildContent(context, padding),
          ],
        ),
      ),
    );
  }

  Container _buildTitle(Size screenSize) {
    return Container(
      padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 10.0),
      child: Text(fixedIncome.classFund,
          textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
      color: fixedIncome.profile == FixedIncomeProfile.moderate
          ? Color.fromRGBO(68, 185, 92, 1.0)
          : Color.fromRGBO(241, 137, 0, 1.0),
      height: 30,
      width: screenSize.width,
    );
  }

  Container _buildHeader(BuildContext context, EdgeInsets padding) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(fixedIncome.manager.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Text(
              AppLocalizations.of(context).cnpj(fixedIncome.cnpj).toUpperCase(),
              style: infoStyle),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, EdgeInsets padding) {
    var boldStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: padding,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            AppLocalizations.of(context)
                                .fixedIncomeMinApplication,
                            style: infoStyle),
                        Text(AppLocalizations.of(context).brlFormatter(
                            fixedIncome.minApplication.toString())),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(AppLocalizations.of(context).fixedIncomeLiquidity,
                            style: infoStyle),
                        Text(fixedIncome.liquidity, style: boldStyle),
                      ])
                ])),
        Container(
          color: Color.fromRGBO(243, 243, 243, 1.0),
          child: Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          AppLocalizations.of(context).fixedIncomeProfitability,
                          style: infoStyle),
                      Text(
                          AppLocalizations.of(context)
                              .percentage(fixedIncome.profitability.toString()),
                          style: boldStyle)
                    ]),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                      AppLocalizations.of(context).moreDetails.toUpperCase(),
                      style:
                          TextStyle(color: Color.fromRGBO(108, 171, 213, 1.0))),
                ),
              ],
            ),
            padding: padding,
          ),
        ),
      ],
    );
  }
}
