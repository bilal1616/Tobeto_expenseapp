import 'package:flutter/material.dart';
import 'package:expenseapp/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          onPrimary: Colors.red,
          primaryContainer: Colors.grey[400]!,
          onPrimaryContainer: Colors.black,
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Color.fromARGB(255, 22, 3, 66),
          foregroundColor: Colors.yellow,
        ),
        cardTheme: const CardTheme().copyWith(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
