import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    final List<Expense> _registeredExpenses = [
      Expense(
        amount: 19.99,
        date: DateTime.now(),
        title: "Flutter Course",
        category: Category.work,
      ),
      Expense(
        amount: 24.99,
        date: DateTime.now(),
        title: "Cinema Movie",
        category: Category.leisure,
      ),
    ];
    return Scaffold(
        body: Column(
            children: [
              Expanded(child: ExpensesList(expenses: _registeredExpenses))
            ]));
  }
}
