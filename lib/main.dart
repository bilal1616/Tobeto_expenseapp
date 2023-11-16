import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

// Programın başlangıcında çalıştırılacak kodlar buraya yazılır
void main() {
  // Uygulama başlatılırken temel material 3 teması kullanılarak ana sayfa oluşturulur.
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// Modelleme => Uygulamada çalışacak yapıların nesne haline getirilmesi