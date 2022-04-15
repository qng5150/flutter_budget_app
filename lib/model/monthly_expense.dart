import 'package:budget/model/schedule.dart';

class MonthlyExpense {
  MonthlyExpense({
    required this.name,
    required this.amount,
    required this.schedule,
  }) {
    if (schedule == Schedule.weekly) {
      monthlyExpense = amount * 52 / 12;
    } else if (schedule == Schedule.yearly) {
      monthlyExpense = amount / 12;
    } else {
      monthlyExpense = amount;
    }
  }

  final String name;
  final double amount;
  final Schedule schedule;
  late double monthlyExpense;
}
