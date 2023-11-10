import 'package:expenseapp/pages/expense_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpenseApp(),
    ),
  );
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseApp'),
      ),
      body: ExpenseList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSnackBar(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Text('Ekle Butonuna Tıklandı! '),
          Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ],
      ),
      action: SnackBarAction(
        label: 'Kapat',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
