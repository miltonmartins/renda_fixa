import 'package:flutter/material.dart';
import 'package:renda_fixa/localization/app_localizations_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'fixed_income/fixed_income_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.red
      ),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      home: FixedIncomeList(),
    );
  }
}
