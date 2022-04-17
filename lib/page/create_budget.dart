import 'package:budget/utils/currency_format.dart';
import 'package:flutter/material.dart';

class CreateBudget extends StatefulWidget {
  const CreateBudget({Key? key}) : super(key: key);

  @override
  _CreateBudgetState createState() {
    return _CreateBudgetState();
  }
}

class _CreateBudgetState extends State<CreateBudget> {
  TextEditingController budgetTargetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final budgetFocus = FocusNode();
  String? budgetError;

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
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('Create A New Budget',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          const Text('Enter the target amount '),
          const SizedBox(height: 32),
          Form(
            key: _formKey,
            child: ListTile(
              leading:
                  Text('\$', style: Theme.of(context).textTheme.headlineMedium),
              subtitle: TextFormField(
                controller: budgetTargetController,
                focusNode: budgetFocus,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  try {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      var targetBudget = currencyFormat.parse(value);
                      if (targetBudget <= 0) return 'Please a non zero target';
                    }
                    return null;
                  } on FormatException catch (_, fe) {
                    return 'Please enter a valid number';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Budget Target',
                  errorText: budgetError,
                  errorMaxLines: 3,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
