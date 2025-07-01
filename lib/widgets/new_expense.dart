import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  late Category _selectedCategory = Category.leisure;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker()async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final selectedDate = await showDatePicker(context: context, firstDate: firstDate, lastDate: now);

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      // Show Error
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 2,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixText: "\$",
                      label: Text("Amount")),
                ),
              ),
              SizedBox(width: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text(_selectedDate == null ? "No Date Selected" : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: Icon(Icons.calendar_month),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              SizedBox(height: 10,),
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category)=> DropdownMenuItem(
                value: category,
                  child: Text(category.name.toString()))).toList(), onChanged: (value){
                if(value == null){
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              }),
              Spacer(),
              ElevatedButton(
                onPressed: () {
               Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Save Expense"),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
