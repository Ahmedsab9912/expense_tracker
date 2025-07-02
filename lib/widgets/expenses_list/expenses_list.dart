import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, myIndex) =>
      Dismissible(
        onDismissed: (direction){
          onRemoveExpense(expenses[myIndex]);
        },
        key: ValueKey(expenses[myIndex]), child:  ExpenseItem(expenses: expenses[myIndex],),)

    );
  }
}
