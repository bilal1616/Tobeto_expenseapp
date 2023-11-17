// 'expense.dart' dosyasını import et, bu dosya gider modelini içerir
import 'package:expenseapp/models/expense.dart';

// 'expense_item.dart' dosyasını import et, bu dosya gider öğesi widget'ını içerir
import 'package:expenseapp/widgets/expense_item.dart';

// Flutter materyal tasarım kütüphanesini import et
import 'package:flutter/material.dart';

// ExpenseList sınıfını StatefulWidget sınıfından türet
class ExpenseList extends StatefulWidget {
  // Harcama listesini alacak bir constructor
  final List<Expense> expenses;

  const ExpenseList(this.expenses, {Key? key}) : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

// ExpenseList'in state nesnesi
class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Merkezde bulunan bir sütun
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Grafik bölümü
          const SizedBox(
            height: 300,
            child: Text(
              "Grafik",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Harcamalar başlığı
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Harcamalar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Harcama listesini gösteren genişletilebilir ListView
          Expanded(
            child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                // Her bir harcama öğesini gösteren ExpenseItem widget'ını kullan ve listeye return et
                return ExpenseItem(widget.expenses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
