import 'package:create_budget/utils/currency_format.dart';
import 'package:flutter/material.dart';

class BudgetTarget extends StatelessWidget {
  const BudgetTarget({
    Key? key,
    required this.targetBudget,
    required this.totalIncome,
    required this.totalExpense,
    required this.netIncome,
    required this.monthsToAchieve,
  }) : super(key: key);

  final double targetBudget;
  final double totalIncome;
  final double totalExpense;
  final double netIncome;
  final int monthsToAchieve;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Budget Target: \$${currencyFormat.format(targetBudget)}',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Total Income',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '\$${currencyFormat.format(totalIncome)}',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Total Expenses',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '\$${currencyFormat.format(totalExpense)}',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Net Income',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Text(
                    '\$${currencyFormat.format(netIncome)}',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Number of months to achieve goal',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Text(
                    '$monthsToAchieve',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
