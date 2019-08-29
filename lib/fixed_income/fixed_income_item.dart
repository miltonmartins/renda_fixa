import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renda_fixa/fixed_income/fixed_income.dart';

class FixedIncomeItem extends StatelessWidget {
  final FixedIncome fixedIncome;

  FixedIncomeItem({@required this.fixedIncome});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    EdgeInsets padding =
        EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15);

    return InkWell(
      onTap: () => {},
      child: Card(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 10),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(screenSize),
            _buildHeader(padding),
            Divider(height: 2.0, color: Colors.black),
            _buildContent(padding),
          ],
        ),
      ),
    );
  }

  Container _buildTitle(Size screenSize) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0),
      child: Text(fixedIncome.classFund,
          textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
      color: fixedIncome.profile.contains('moderado')
          ? Color.fromRGBO(68, 185, 92, 1.0)
          : Color.fromRGBO(241, 137, 0, 1.0),
      height: 25,
      width: screenSize.width,
    );
  }

  Container _buildHeader(EdgeInsets padding) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(fixedIncome.manager.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Text('CNPJ: ${fixedIncome.cnpj}'),
        ],
      ),
    );
  }

  Container _buildContent(EdgeInsets padding) {
    var boldStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Valor Minimo'),
                      Text('RS ${fixedIncome.minApplication}'),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Liquidez'),
                      Text(fixedIncome.liquidity, style: boldStyle),
                    ])
              ]),
          SizedBox(height: 15),
          Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Rentabilidade Anual'),
                      Text('${fixedIncome.profitability} %', style: boldStyle)
                    ]),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text('${"+ detalhes".toUpperCase()}',
                      style: TextStyle(color: Colors.indigoAccent)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
