import 'package:expenseapp/pages/expense_list.dart';
import 'package:flutter/material.dart';

// Uygulama ana giriş noktası
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Debug banner'ın görüntülenmesini engeller
      home: ExpenseApp(), // Uygulamanın ana bileşeni ExpenseApp
    ),
  );
}

// Ana uygulama bileşeni
class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseApp'), // Uygulama başlığı
      ),
      body: ExpenseList(
          expenses: []), // ExpenseList bileşeni, boş bir harcama listesi alır
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSnackBar(context); // SnackBar'ı gösteren metodu çağırır
        },
        child: const Icon(Icons.add), // Ekleme butonu ikonu
      ),
    );
  }

  // SnackBar'ı gösteren metod
  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Text('Ekle Butonuna Tıklandı! '), // SnackBar içeriği
          Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ],
      ),
      action: SnackBarAction(
        label: 'Kapat', // SnackBar üzerindeki kapatma butonunun etiketi
        onPressed: () {
          ScaffoldMessenger.of(context)
              .hideCurrentSnackBar(); // SnackBar'ı kapatma işlemi
        },
      ),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar); // SnackBar'ı görüntüleme
  }
}
