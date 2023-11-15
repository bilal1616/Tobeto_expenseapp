import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

// Tek Sorumluluk İlkesi
void main() {
  // Uygulama başlatılırken temel materyal 3 teması kullanılarak ana sayfa oluşturulur.
  runApp(
    MaterialApp(theme: ThemeData(useMaterial3: true), home: const MainPage()),
    
  );
}

// Modelleme => Uygulamada çalışacak yapıların nesne haline getirilmesi