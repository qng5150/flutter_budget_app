import 'package:create_budget/model/monthly_expense.dart';
import 'package:create_budget/utils/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key, required this.expenses}) : super(key: key);

  final List<MonthlyExpense> expenses;

  @override
  _ExpenseListState createState() {
    return _ExpenseListState();
  }
}

class _ExpenseListState extends State<ExpenseList> {
  final ScrollController scrollController = ScrollController();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Monthly Expenses',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.left,
              ),
              ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  label: const Text('Add Expense'),
                  onPressed: () => context.push('/budget/expense'))
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: widget.expenses.length,
                  itemBuilder: (context, i) {
                    MonthlyExpense expense = widget.expenses[i];

                    return SizedBox(
                      height: 26,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(expense.name ?? 'No Name'),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                                '\$${currencyFormat.format(expense.monthlyExpense)}/month'),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 20,
                              child: RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Colors.red,
                                child: const Icon(Icons.remove, size: 10),
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
