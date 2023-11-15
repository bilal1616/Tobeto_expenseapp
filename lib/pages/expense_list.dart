import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(newExpense, {Key? key}) : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  // dummy data
  final List<Expense> expenses = [
    Expense(
        name: "Yiyecek",
        price: 200,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Flutter Udemy Course",
        price: 2000,
        date: DateTime.now(),
        category: Category.education),
    Expense(
        name: "Kapadokya Gezisi",
        price: 20000,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        name: "Oyuncu Koltuğu",
        price: 8000,
        date: DateTime.now(),
        category: Category.expense),
  ]; // firebase,veritabanı

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 300,
            child: Text("Grafik", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Harcamalar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ), // Harcamalar başlığı
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ExpenseItem(expenses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
// Topbar eklemek vs..
