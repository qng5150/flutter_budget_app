import 'package:budget/monthly_budget_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Load App Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MonthlyBudgetApp());
  });
}
