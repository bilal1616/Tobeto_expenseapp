import 'package:flutter/material.dart';
import 'package:expenseapp/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

// Uygulama ana sınıfı
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tema ayarları
      theme: ThemeData(
        // Material 3 temasını kullan
        useMaterial3: true,

        // Renk şeması ayarları
        colorScheme: ColorScheme.light(
          primary: Colors.blue, // Ana renk
          onPrimary: Colors.red, // Ana renk üzerindeki metin rengi
          primaryContainer: Colors
              .grey[400]!, // Ana renk ile arkaplan arasındaki boşluk rengi
          onPrimaryContainer: Colors
              .black, // Ana renk ile arkaplan arasındaki boşluk üzerindeki metin rengi
        ),

        // AppBar temaları
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor:
              Color.fromARGB(255, 22, 3, 66), // AppBar'ın arkaplan rengi
          foregroundColor: Colors.yellow, // AppBar üzerindeki metin rengi
        ),

        // Card temaları
        cardTheme: const CardTheme().copyWith(
          color: Colors.white, // Kartın arkaplan rengi
          margin: EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // Kartın kenar boşlukları
        ),

        // Metin temaları
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
      ),

      // Ana sayfa
      home: MainPage(),

      // Debug banner'ı gösterme
      debugShowCheckedModeBanner: false,
    );
  }
}
