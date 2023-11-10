import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

// Harcama listesini gösteren StatefulWidget
class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key, required List<Expense> expenses})
      : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

// State sınıfı
class _ExpenseListState extends State<ExpenseList> {
  // Dummy veri - Gerçek veritabanından gelebilir
  final List<Expense> expenses = [
    Expense(
        name: "Izgara",
        price: 350,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Flutter Udemy Kursu",
        price: 4000,
        date: DateTime.now(),
        category: Category.education),
    Expense(
        name: "Uzak doğu Turu",
        price: 10000,
        date: DateTime.now(),
        category: Category.travel)
  ];

  // Listview render
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 300,
            child: Text("Grafik"), // Grafik alanı
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(expenses[index].name), // Harcama adı
                      subtitle: Row(
                        children: [
                          Text(
                            "Price: ",
                          ),
                          Text(
                            "${expenses[index].price.toString()}",
                          ), // Harcama miktarı
                          Text(
                            " ₺", // Türk Lirası Sembolü
                          ), // TL simgesi
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Text("Liste Bitişi"), // Liste bittiğinde görünen metin
        ],
      ),
    );
  }
}
