import 'package:flutter_test/flutter_test.dart';
import 'package:renda_fixa/fixed_income/fixed_income_bloc.dart';

void main() {
  test("Check details by cnpj", () async {
    var expected = "Lorem ipsum dolor sit amet, alia mucius ut mea,"
        " veniam petentium instructior ne nec. Pri at epicurei omittantur appellantur."
        " Vim et elit malorum, diam choro nonumes has et. No quaeque aliquid albucius vel,"
        " vim libris epicuri referrentur eu. No mei hinc quas omittantur";
    var details =
        await FixedIncomeBLoc().getFixedIncomeDetails('34669263000156');
    expect(details, expected);
  });
}
