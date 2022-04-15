import 'package:flutter/material.dart';

class MonthlyBudgetPage extends StatefulWidget {
  MonthlyBudgetPage({Key? key}) : super(key: key);

  @override
  _MonthlyBudgetPageState createState() {
    return _MonthlyBudgetPageState();
  }
}

class _MonthlyBudgetPageState extends State<MonthlyBudgetPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Monthly Budget'),
      ),
      body: Center(
        child: Container(
          child: Text('text'),
        ),
      ),
    );
  }
}
