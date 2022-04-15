import 'package:budget/page/budget_page.dart';
import 'package:flutter/material.dart';

class MonthlyBudgetApp extends StatelessWidget {
  MonthlyBudgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monthly Budget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MonthlyBudgetPage(),
    );
  }
}
