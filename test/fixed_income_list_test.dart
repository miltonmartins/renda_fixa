import 'package:flutter_test/flutter_test.dart';
import 'package:renda_fixa/fixed_income/fixed_income_bloc.dart';

void main() {
  test("Check if the list is not empty", () async {
    var list = await FixedIncomeBLoc().getFixedIncomeListFromJSON();
    expect(list.length, 3);
  });
}
