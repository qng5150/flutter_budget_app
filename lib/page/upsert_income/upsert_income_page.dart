import 'package:create_budget/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpsertIncomePage extends StatefulWidget {
  UpsertIncomePage({Key? key}) : super(key: key);

  @override
  _UpsertIncomePageState createState() {
    return _UpsertIncomePageState();
  }
}

class _UpsertIncomePageState extends State<UpsertIncomePage> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode incomeNameFocus;
  late FocusNode incomeAmountFocus;
  Schedule selectedSchedule = Schedule.monthly;

  @override
  void initState() {
    super.initState();
    incomeNameFocus = FocusNode();
    incomeAmountFocus = FocusNode();
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
        title: const Text('Add income'),
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
                focusNode: incomeNameFocus,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Income Name',
                  errorMaxLines: 3,
                ),
              ),
              TextFormField(
                focusNode: incomeAmountFocus,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                textInputAction: TextInputAction.next,
                validator: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Income Amount',
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
                          'Income Schedule',
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
                                    incomeAmountFocus.unfocus();
                                    incomeNameFocus.unfocus();
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
