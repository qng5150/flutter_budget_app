import 'package:create_budget/model/schedule.dart';

class MonthlyIncome {
  MonthlyIncome();
  MonthlyIncome.fromAttributes({
    required this.name,
    required double amount,
    required this.schedule,
  }) {
    this.amount = amount;
  }

  String? name;
  double _amount = 0;
  Schedule schedule = Schedule.monthly; // defaults to monthly
  late double monthlyIncome;

  set amount(double theAmount) {
    _amount = theAmount;
    _calculateMonthlyIncome();
  }

  double get amount => _amount;

  @override
  int get hashCode => name.hashCode + amount.hashCode + schedule.hashCode;

  @override
  bool operator ==(Object other) {
    return other is MonthlyIncome &&
        name == other.name &&
        _amount == other.amount &&
        schedule == other.schedule;
  }

  void _calculateMonthlyIncome() {
    if (schedule == Schedule.weekly) {
      monthlyIncome = amount * 52 / 12;
    } else if (schedule == Schedule.yearly) {
      monthlyIncome = amount / 12;
    } else {
      monthlyIncome = amount;
    }
  }
}
