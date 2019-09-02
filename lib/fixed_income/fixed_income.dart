import 'package:renda_fixa/fixed_income/fixed_income_profile.dart';

class FixedIncome {
  String name;
  String cnpj;
  int minApplication;
  FixedIncomeProfile profile;
  String score;
  String manager;
  String liquidity;
  double profitability;
  String classFund;

  FixedIncome(
      {this.name,
      this.cnpj,
      this.minApplication,
      this.profile,
      this.score,
      this.manager,
      this.liquidity,
      this.profitability,
      this.classFund});

  factory FixedIncome.fromJson(Map<String, dynamic> json) {
    return FixedIncome(
        name: json['nome'],
        cnpj: json['cnpj'],
        classFund: json['classe'],
        minApplication: json['aplicacao_minima'],
        manager: json['gestor'],
        liquidity: json['liquidez'],
        profile: json['perfil'].contains('moderado')
            ? FixedIncomeProfile.moderate
            : FixedIncomeProfile.aggressive,
        score: json['score'],
        profitability: json['rentabilidade']);
  }
}
