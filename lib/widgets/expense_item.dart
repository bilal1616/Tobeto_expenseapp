import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.name), // Harcama adı
            Row(
              children: [
                Text(expense.price.toStringAsFixed(2) + " ₺"), // Harcama tutarı
                const Spacer(),
                Icon(categoryIcons[
                    expense.category]), // Harcama kategorisinin ikonu
                const SizedBox(width: 8),
                Text(expense.formattedDate), // Harcama tarihi
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Modelleme => Harcama öğesini gösteren kart elemanı
