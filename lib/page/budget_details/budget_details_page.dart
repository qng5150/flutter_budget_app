import 'package:create_budget/model/monthly_expense.dart';
import 'package:create_budget/model/monthly_income.dart';
import 'package:create_budget/model/schedule.dart';
import 'package:create_budget/page/budget_details/budget_target.dart';
import 'package:create_budget/page/budget_details/expense_list.dart';
import 'package:create_budget/page/budget_details/income_list.dart';
import 'package:flutter/material.dart';

class BudgetDetailsPage extends StatefulWidget {
  const BudgetDetailsPage({Key? key}) : super(key: key);

  @override
  _BudgetDetailsPageState createState() {
    return _BudgetDetailsPageState();
  }
}

class _BudgetDetailsPageState extends State<BudgetDetailsPage>
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Budget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const BudgetTarget(
            targetBudget: 200000.0,
            totalIncome: 5000,
            totalExpense: 2000,
            netIncome: 3000,
            monthsToAchieve: 10,
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
                    MonthlyExpense.fromAttributes(
                        schedule: Schedule.monthly, amount: 200, name: 'Rent'),
                  ],
                ),
                IncomeList(
                  incomeList: [
                    MonthlyIncome.fromAttributes(
                        schedule: Schedule.monthly,
                        amount: 200,
                        name: 'Salary'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
