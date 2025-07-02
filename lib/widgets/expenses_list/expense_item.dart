import 'dart:math';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenses});

  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16
          ),
          child: Column(
            children: [
              Text(expenses.title),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text("\$ ${expenses.amount.toStringAsFixed(2)}"),
                  Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expenses.category]),
                      SizedBox(width: 8,),
                      Text(expenses.formattedDate)
                    ],
                  )
                ],
              )
            ],
          )
        )
    );
  }
}
