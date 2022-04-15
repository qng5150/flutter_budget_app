import 'package:budget/model/schedule.dart';

class MonthlyIncome {
  MonthlyIncome({
    required this.name,
    required this.amount,
    required this.schedule,
  }) {
    if (schedule == Schedule.weekly) {
      monthlyIncome = amount * 52 / 12;
    } else if (schedule == Schedule.yearly) {
      monthlyIncome = amount / 12;
    } else {
      monthlyIncome = amount;
    }
  }

  final String name;
  final double amount;
  final Schedule schedule;
  late double monthlyIncome;
}
