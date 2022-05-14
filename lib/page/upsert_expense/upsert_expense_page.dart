import 'package:create_budget/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpsertExpensePage extends StatefulWidget {
  UpsertExpensePage({Key? key}) : super(key: key);

  @override
  _UpsertExpensePageState createState() {
    return _UpsertExpensePageState();
  }
}

class _UpsertExpensePageState extends State<UpsertExpensePage> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode expenseNameFocus;
  late FocusNode expenseAmountFocus;
  Schedule selectedSchedule = Schedule.monthly;

  @override
  void initState() {
    super.initState();
    expenseNameFocus = FocusNode();
    expenseAmountFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Schedule> scheduleList = Schedule.values;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                focusNode: expenseNameFocus,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Expense Name',
                  errorMaxLines: 3,
                ),
              ),
              TextFormField(
                focusNode: expenseAmountFocus,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                textInputAction: TextInputAction.next,
                validator: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Expense Amount',
                  errorMaxLines: 3,
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Expense Schedule',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                          itemCount: scheduleList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RadioListTile<Schedule>(
                                title: Text(scheduleList[index].name),
                                value: scheduleList[index],
                                selected:
                                    selectedSchedule == scheduleList[index],
                                groupValue: selectedSchedule,
                                onChanged: (Schedule? schedule) {
                                  setState(() {
                                    selectedSchedule = scheduleList[index];
                                    expenseAmountFocus.unfocus();
                                    expenseNameFocus.unfocus();
                                  });
                                });
                          }),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Save'),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
