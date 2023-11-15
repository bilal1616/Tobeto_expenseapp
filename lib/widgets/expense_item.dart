// 'expense.dart' dosyasını import et, bu dosya gider modelini içerir
import 'package:expenseapp/models/expense.dart';

// Flutter materyal tasarım kütüphanesini import et
import 'package:flutter/material.dart';

// ExpenseItem sınıfını StatelessWidget sınıfından türet
class ExpenseItem extends StatelessWidget {
  // Yapıcı metodu, bir parametre olarak 'expense' alır
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);

  // Expense sınıfından bir nesne alacak bir değişken tanımla
  final Expense expense;

  // Build metodu, widget'ın görünümünü oluşturur
  @override
  Widget build(BuildContext context) {
    // Kart elemanını içerecek bir Card widget'ı ekleyin
    return Card(
      // Kartın kenarlarını düzenlemek için BeveledRectangleBorder kullan
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
      // Kart içeriği için Padding widget'ını ekleyin
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        // Bir sütun içine yerleştirilmiş çeşitli widget'ları içerecek bir Column widget'ı ekleyin
        child: Column(
          children: [
            // Harcama adını içerecek bir Text widget'ı ekleyin
            Text(expense.name), // Harcama adı
            // Harcama bilgilerini içerecek bir Row widget'ı ekleyin
            Row(
              children: [
                // Harcama tutarını ve para birimini içerecek bir Text widget'ı ekleyin
                Text(expense.price.toStringAsFixed(2) + " ₺"), // Harcama tutarı
                // Diğer widget'lar arasında boşluk bırakmak için Spacer widget'ını ekleyin
                const Spacer(),
                // Harcama kategorisinin ikonunu içerecek bir Icon widget'ı ekleyin
                Icon(categoryIcons[
                    expense.category]), // Harcama kategorisinin ikonu
                // İkon ile tarih arasında boşluk bırakmak için SizedBox widget'ını ekleyin
                const SizedBox(width: 8),
                // Harcama tarihini içerecek bir Text widget'ı ekleyin
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
