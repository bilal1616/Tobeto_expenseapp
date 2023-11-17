import 'package:flutter/material.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/pages/expense_list.dart';
import 'package:expenseapp/widgets/new_expense.dart';

// Ana sayfa widget'ı, uygulamanın temel görsel bileşenlerini içerir
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

// Ana sayfa'nın state nesnesi
class _MainPageState extends State<MainPage> {
  // Harcama listesini tutan liste
  List<Expense> expenses = [];

  // Yeni bir harcama eklemek için kullanılan metod
  void _addExpense(Expense newExpense) {
    setState(() {
      expenses.add(newExpense);
    });
  }

  // Widget'ın görüntüsünü oluşturan metod
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sayfanın başlık çubuğu
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Expense App"),
        actions: [
          // Başlık çubuğundaki artı ikonu ile yeni harcama eklemek için IconButton
          IconButton(
            onPressed: () {
              // Yeni harcama ekranını açmak için alt sayfayı gösteren showModalBottomSheet
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  // Yeni harcama ekranını içeren widget
                  return FractionallySizedBox(
                    heightFactor: 0.60,
                    child: NewExpense(
                      onAddExpense: _addExpense,
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      // Sayfanın ana içeriği, ExpenseList widget'ı ile gösterilen harcama listesi
      body: ExpenseList(expenses),
      // Sayfanın arkaplan rengi
      backgroundColor: Color.fromARGB(255, 232, 227, 227),
    );
  }
}