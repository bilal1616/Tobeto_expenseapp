import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

// Harcama kategorilerini temsil eden enum
enum Category { food, education, travel, expense }

// Harcama kategorilerine karşılık gelen ikonlar
const categoryIcons = {
  Category.food: Icons.food_bank_outlined, // Yiyecek kategorisi ikonu
  Category.education: Icons.cast_for_education, // Eğitim kategorisi ikonu
  Category.travel: Icons.travel_explore, // Seyahat kategorisi ikonu
  Category.expense: Icons.shopping_basket_outlined, // Gider kategorisi ikonu
};

// Harcama sınıfı, her bir harcama öğesini temsil eder
class Expense {
  // Yapıcı metot ile harcama öğesinin özellikleri belirlenir
  Expense({
    required this.name,   // Harcama adı
    required this.price,  // Harcama tutarı
    required this.date,   // Harcama tarihi
    required this.category // Harcama kategorisi
  }) : id = uuid.v4();    // UUID ile benzersiz bir kimlik oluşturulur

  // Harcama öğesinin özellikleri
  final String id;        // Harcama kimlik numarası
  final String name;      // Harcama adı
  final double price;     // Harcama tutarı
  final DateTime date;    // Harcama tarihi
  final Category category; // Harcama kategorisi

  // Tarih formatını belirli bir formata dönüştüren metot
  String get formattedDate {
    var formatter = DateFormat.yMd();
    return formatter.format(date);
  }
}


// Getter method => Bir değişken gibi davranır
// Setter method => Bir değişkenin değerini değiştiren method