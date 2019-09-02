import 'package:flutter/material.dart';
import 'package:renda_fixa/localization/app_localization.dart';

class RefreshButton extends StatelessWidget {
  final String error;
  final Function onPressed;

  RefreshButton({@required this.error, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(error, textAlign: TextAlign.center),
          OutlineButton(
              child: Text(AppLocalizations.of(context).refresh),
              onPressed: onPressed)
        ],
      ),
    );
  }
}
