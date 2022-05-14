import 'package:create_budget/model/monthly_income.dart';
import 'package:create_budget/utils/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncomeList extends StatefulWidget {
  const IncomeList({Key? key, required this.incomeList}) : super(key: key);
  final List<MonthlyIncome> incomeList;

  @override
  _IncomeListState createState() {
    return _IncomeListState();
  }
}

class _IncomeListState extends State<IncomeList> {
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Monthly Income',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.left,
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24.0,
                ),
                label: const Text('Add Income'),
                onPressed: () => context.push('/budget/income'),
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: widget.incomeList.length,
                  itemBuilder: (context, i) {
                    MonthlyIncome income = widget.incomeList[i];
                    return SizedBox(
                      height: 26,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(income.name ?? 'No Name'),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                                '\$${currencyFormat.format(income.monthlyIncome)}/month'),
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
