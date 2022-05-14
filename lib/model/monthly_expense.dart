import 'package:budget/model/schedule.dart';

class MonthlyExpense {
  MonthlyExpense();
  MonthlyExpense.fromAttributes({
    required this.name,
    required double amount,
    required this.schedule,
  }) {
    this.amount = amount;
  }

  String? name;
  double _amount = 0;
  Schedule schedule = Schedule.monthly;
  double _monthlyExpense = 0;

  double get monthlyExpense => _monthlyExpense;

  set amount(double theAmount) {
    _amount = theAmount;
    _calculateMonthlyExpense();
  }

  double get amount => _amount;

  @override
  int get hashCode => name.hashCode + amount.hashCode + schedule.hashCode;

  @override
  bool operator ==(Object other) {
    return other is MonthlyExpense &&
        name == other.name &&
        _amount == other.amount &&
        schedule == other.schedule;
  }

  void _calculateMonthlyExpense() {
    if (schedule == Schedule.weekly) {
      _monthlyExpense = _amount * 52 / 12;
    } else if (schedule == Schedule.yearly) {
      _monthlyExpense = _amount / 12;
    } else {
      _monthlyExpense = _amount;
    }
  }
}
