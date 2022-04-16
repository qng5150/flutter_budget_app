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
          ListTile(
            leading:
                Text('\$', style: Theme.of(context).textTheme.headlineMedium),
            subtitle: TextField(
              controller: budgetTargetController,
              focusNode: budgetFocus,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => budgetFocus.requestFocus(),
              decoration: InputDecoration(
                labelText: 'Budget Target',
                errorText: budgetError,
                errorMaxLines: 3,
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
