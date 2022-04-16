import 'package:budget/model/monthly_expense.dart';
import 'package:budget/model/monthly_income.dart';
import 'package:budget/model/schedule.dart';
import 'package:budget/page/budget_target.dart';
import 'package:budget/page/expense_list.dart';
import 'package:budget/page/income_list.dart';
import 'package:flutter/material.dart';

class BudgetDetails extends StatefulWidget {
  BudgetDetails({Key? key}) : super(key: key);

  @override
  _BudgetDetailsState createState() {
    return _BudgetDetailsState();
  }
}

class _BudgetDetailsState extends State<BudgetDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        BudgetTarget(
          targetBudget: 200000.00,
          totalIncome: 5000,
          totalExpense: 200,
          netIncome: 5000 - 200,
          monthsToAchieve: 200000 ~/ (5000 - 200).round(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: const [
                Tab(
                  child: Text('Expenses'),
                ),
                Tab(
                  child: Text('Income'),
                ),
              ]),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ExpenseList(
                expenses: [
                  MonthlyExpense(
                      schedule: Schedule.monthly, amount: 200, name: 'Rent'),
                ],
              ),
              IncomeList(
                incomeList: [
                  MonthlyIncome(
                      schedule: Schedule.monthly, amount: 200, name: 'Salary'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
