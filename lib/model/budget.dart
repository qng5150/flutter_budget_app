import 'package:budget/model/monthly_income.dart';
import 'package:budget/model/monthly_expense.dart';

class Budget {
  Budget({required this.target});

  List<MonthlyExpense> expenses = [];
  List<MonthlyIncome> incomes = [];
  double netIncome = 0;
  double target;
  double monthsToAchieve = 0;

  void addExpense(MonthlyExpense expense) {
    expenses.add(expense);
    _calculateNetIncome();
    _calculateTargetTime();
  }

  void addIncome(MonthlyIncome income) {
    incomes.add(income);
    _calculateNetIncome();
    _calculateTargetTime();
  }

  void _calculateNetIncome() {
    double totalIncome = 0;
    double totalExpenses = 0;
    for (var element in incomes) {
      totalIncome += element.monthlyIncome;
    }
    for (var element in expenses) {
      totalExpenses += element.monthlyExpense;
    }
    netIncome = totalIncome - totalExpenses;
  }

  void _calculateTargetTime() {
    if (target == 0 && netIncome == 0) {
      return;
    }
    monthsToAchieve = (target / netIncome).roundToDouble();
  }
}
