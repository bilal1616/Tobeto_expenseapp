import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

// Gider öğesi gösteren Stateles Widget
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);

  // Görüntülenecek gider nesnesi
  final Expense expense;

  // Dismissible Widget'ı ile sürükleyip silmeyi sağlar
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            // Gider adını gösteren metin
            Text(
              expense.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // Gider miktarı, kategori simgesi ve tarih bilgisini gösteren satır
            Row(
              children: [
                // Miktarı ve para birimini gösteren metin
                Text("${expense.price.toStringAsFixed(2)} ₺"),

                // Boşluk bırakma
                const Spacer(),

                // Kategori simgesi
                Icon(categoryIcons[expense.category]),

                // Boşluk bırakma
                const SizedBox(width: 8),

                // Formatlı tarih bilgisini gösteren metin
                Text(expense.formattedDate)
              ],
            )
          ],
        ),
      ),
    );
  }
}
