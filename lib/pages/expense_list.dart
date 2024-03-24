import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/chart/chart.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

// Gider listesini gösteren Stateful Widget
class ExpenseList extends StatefulWidget {
  const ExpenseList(this.expenses, this.onRemove, {Key? key}) : super(key: key);

  // Gider listesi ve gideri kaldırma fonksiyonu
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

// Gider listesi State'i
class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Grafik veya diğer görsel öğeler için ayrılan boşluk
          SizedBox(
            height: 250,
            child: Chart(
              expenses: widget.expenses,
            ),
          ),

          // "Harcamalar" metni
          Text(
            "Harcamalar",
            style: Theme.of(context).textTheme.titleLarge,
          ),

          // Gider listesini gösteren ListView
          Expanded(
            child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index]),
                  child: ExpenseItem(widget.expenses[index]),
                  // Giderin kaydırma yönlendirmesi
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      // Soldan sağa kaydırma durumunda gideri kaldır
                      widget.onRemove(widget.expenses[index]);
                    } else if (direction == DismissDirection.endToStart) {
                      // Sağdan sola kaydırma durumunda gideri kaldır
                      widget.onRemove(widget.expenses[index]);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
