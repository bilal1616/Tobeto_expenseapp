// 'expense.dart' dosyasını import et, bu dosya gider modelini içerir
import 'package:expenseapp/models/expense.dart';

// 'expense_item.dart' dosyasını import et, bu dosya gider öğesi widget'ını içerir
import 'package:expenseapp/widgets/expense_item.dart';

// Flutter materyal tasarım kütüphanesini import et
import 'package:flutter/material.dart';

// ExpenseList sınıfını StatefulWidget sınıfından türet
class ExpenseList extends StatefulWidget {
  // Yapıcı metodu, bir parametre olarak 'newExpense' alır
  const ExpenseList(newExpense, {Key? key}) : super(key: key);

  // createState metodu, ExpenseList widget'ının durumunu oluşturur
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

// _ExpenseListState sınıfını StatefulWidget'ın durumu olan _ExpenseListState sınıfından türet
class _ExpenseListState extends State<ExpenseList> {
  // Dummy veri oluştur, burada gerçek bir veritabanı kullanılabilir
  final List<Expense> expenses = [
    // Gider örnekleri
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
  ]; // Gerçek veritabanı kullanılacaksa bu veri yerine dinamik veri alınmalı

  // Build metodu, widget'ın görünümünü oluşturur
  @override
  Widget build(BuildContext context) {
    // Ekranın ortasına yerleştirilmiş bir sütun oluştur
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Grafik veya başka bir görselleştirmeyi içerecek bir SizedBox ekleyin
          const SizedBox(
            height: 300,
            child: Text("Grafik",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          // Harcamalar başlığını içerecek bir Padding ekleyin
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Harcamalar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ), // Harcamalar başlığı
          ),
          // Gider listesini görüntüleyecek bir ListView.builder ekleyin
          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                // Her bir gider öğesini gösterecek ExpenseItem widget'ını ekleyin
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
