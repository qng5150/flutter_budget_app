import 'dart:collection';
import 'monthly_expense.dart';
import 'monthly_income.dart';

class Budget {
  Budget({required this.target});

  LinkedHashSet<MonthlyExpense> expenses = LinkedHashSet<MonthlyExpense>();
  LinkedHashSet<MonthlyIncome> incomes = LinkedHashSet<MonthlyIncome>();
  double netIncome = 0;
  double target = 0;
  double monthsToAchieve = 0;
  double totalIncome = 0;
  double totalExpense = 0;

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
    double totalExpense = 0;
    for (var element in incomes) {
      totalIncome += element.monthlyIncome;
    }
    for (var element in expenses) {
      totalExpense += element.monthlyExpense;
    }
    this.totalExpense = totalExpense;
    this.totalIncome = totalIncome;
    netIncome = totalIncome - totalExpense;
  }

  void _calculateTargetTime() {
    if (target == 0 && netIncome == 0) {
      return;
    }
    monthsToAchieve = (target / netIncome).roundToDouble();
  }
}
