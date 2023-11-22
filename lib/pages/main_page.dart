import 'package:expenseapp/pages/expense_list.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenseapp/models/expense.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isDarkModeEnabled = false;
  final List<Expense> expenses = [
    Expense(
      name: "Yiyecek",
      price: 250,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      name: "Flutter Udemy Kursu",
      price: 1500,
      date: DateTime.now(),
      category: Category.education,
    ),
  ];

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final removedExpenseIndex = expenses.indexOf(expense);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Expense Deleted",
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
        action: SnackBarAction(
          textColor: Colors.red,
          label: "Undo",
          onPressed: () {
            setState(() {
              expenses.insert(removedExpenseIndex, expense);
            });
          },
        ),
      ),
    );

    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Switch(
                value: _isDarkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _isDarkModeEnabled = value;
                  });
                },
                activeTrackColor: Theme.of(context).colorScheme.primary,
                activeColor: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 64),
              const Center(child: Text("Expense App")),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) => NewExpense(
                    onAdd: (expense) => addExpense(expense),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: ExpenseList(expenses, removeExpense),
      ),
    );
  }
}
