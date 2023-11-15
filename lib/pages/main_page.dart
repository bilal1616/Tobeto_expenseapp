// 'expense_list.dart' dosyasını import et
import 'package:expenseapp/pages/expense_list.dart';

// 'new_expense.dart' dosyasını import et
import 'package:expenseapp/widgets/new_expense.dart';

// Flutter materyal tasarım kütüphanesini import et
import 'package:flutter/material.dart';

// MainPage sınıfını StatelessWidget sınıfından türet
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold widget'ını kullanarak temel sayfa yapılandırması oluştur
    return Scaffold(
      // AppBar widget'ını kullanarak üst çubuk oluştur
      appBar: AppBar(
        backgroundColor:
            Colors.deepPurpleAccent, // Arka plan rengi olarak derin mor kullan
        title: const Text(
            "Expense App"), // Başlık olarak "Expense App" metnini kullan
        actions: [
          // Sağ üst köşede '+' simgesi içeren IconButton ekleyerek yeni gider eklemek için bir alt sayfa aç
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  // Ekranın yarısını kaplayacak şekilde yeni gider eklemek için alt sayfa oluştur
                  return FractionallySizedBox(
                    heightFactor: 0.60,
                    child: NewExpense(),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      // Ana sayfa içeriği olarak ExpenseList widget'ını kullan
      body: ExpenseList(()), // Burada NewExpense'in bir örneğini geçir
      // Sayfa arka plan rengini belirle
      backgroundColor: Color.fromARGB(255, 232, 227, 227),
    );
  }
}
