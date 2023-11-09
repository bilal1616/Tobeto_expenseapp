// Bu dosya, ana uygulama giriş noktasını içerir ve ExpenseApp widget'ını başlatır.
import 'package:expenseapp/pages/expense_list.dart';
import 'package:flutter/material.dart';

void main() {
  // Uygulamayı başlatan main fonksiyonu
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
    // Ana uygulama widget'ı olan ExpenseApp'i oluşturan build fonksiyonu
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseApp'), // Uygulama başlığı
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showSnackBar(context);
            },
          ),
        ],
      ),
      body: ExpenseList(), // Ana içerik olarak ExpenseList widget'ını kullanır
    );
  }

  void showSnackBar(BuildContext context) {
    // SnackBar'ı gösteren fonksiyon
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

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar); // SnackBar'ı görüntüler
  }
}
