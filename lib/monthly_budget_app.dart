import 'package:create_budget/routes/routes.dart';
import 'package:flutter/material.dart';

class MonthlyBudgetApp extends StatelessWidget {
  const MonthlyBudgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Monthly Budget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
