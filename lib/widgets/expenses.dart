import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

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

   void _openAddExpensesOverlay(){
     showModalBottomSheet(
         context: context, builder:(ctx) => NewExpense()
      );
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(onPressed:_openAddExpensesOverlay, icon: Icon(Icons.add))
        ],
      ),
        body: Column(
            children: [
              Text("The chart"),
              Expanded(
                  child: ExpensesList(
                      expenses: _registeredExpenses)),
            ]));
  }
}
