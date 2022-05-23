import 'package:create_budget/model/schedule.dart';
import 'package:uuid/uuid.dart';

class MonthlyIncome {
  MonthlyIncome();
  MonthlyIncome.fromAttributes({
    required this.name,
    required double amount,
    required this.schedule,
  }) {
    this.amount = amount;
  }

  final id = const Uuid().v4();
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
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return other is MonthlyIncome && id == other.id;
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
