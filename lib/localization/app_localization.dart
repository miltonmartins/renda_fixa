import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'pt': {
      'cnpj': 'cnpj: [value]',
      'fixedIncomeMinApplication': 'Valor Minimo',
      'fixedIncomeLiquidity': 'Liquidez',
      'fixedIncomeProfitability': 'Rentabilidade Anual',
      'moreDetails': '+ detalhes',
      'brl': 'R\$ [value]',
      'percentage': '[value]%',
      'connectionFailed': 'Falha na conexão',
      'refresh': 'Atualizar'
    },
  };

  String cnpj(String value) =>
      _replaceVariables(_localizedValues[locale.languageCode]['cnpj'],
          args: {"value": value});

  String get fixedIncomeMinApplication =>
      _localizedValues[locale.languageCode]['fixedIncomeMinApplication'];

  String get fixedIncomeLiquidity =>
      _localizedValues[locale.languageCode]['fixedIncomeLiquidity'];

  String get fixedIncomeProfitability =>
      _localizedValues[locale.languageCode]['fixedIncomeProfitability'];

  String get moreDetails =>
      _localizedValues[locale.languageCode]['moreDetails'];

  String brlFormatter(String value) =>
      _replaceVariables(_localizedValues[locale.languageCode]['brl'],
          args: {"value": value});

  String percentage(String value) =>
      _replaceVariables(_localizedValues[locale.languageCode]['percentage'],
          args: {"value": value});

  String get connectionFailed =>
      _localizedValues[locale.languageCode]['connectionFailed'];

  String get refresh =>
      _localizedValues[locale.languageCode]['refresh'];

  String _replaceVariables(String text, {Map<String, dynamic> args}) {
    var replaced = text;
    if (args != null) {
      args.keys.forEach((key) {
        replaced = replaced.replaceAll("[$key]", args[key]);
      });
    }
    return replaced;
  }
}
