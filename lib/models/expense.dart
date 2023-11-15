// identifier => kimlik belirleyici (id)

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, education, travel, expense }

const categoryIcons = {
  Category.food: Icons.food_bank_outlined, // Yiyecek kategorisi ikonu
  Category.education: Icons.cast_for_education, // Eğitim kategorisi ikonu
  Category.travel: Icons.travel_explore, // Seyahat kategorisi ikonu
  Category.expense: Icons.shopping_basket_outlined, // Gider kategorisi ikonu
};

class Expense {
  Expense({
    required this.name, // Harcama adı
    required this.price, // Harcama tutarı
    required this.date, // Harcama tarihi
    required this.category // Harcama kategorisi
  }) : id = uuid.v4(); // UUID ile benzersiz bir kimlik oluşturulur

  final String id; // Harcama kimlik numarası
  final String name; // Harcama adı
  final double price; // Harcama tutarı
  final DateTime date; // Harcama tarihi
  final Category category; // Harcama kategorisi

  // Getter method => Bir değişken gibi davranır
  // Setter method => Bir değişkenin değerini değiştiren method

  String get formattedDate {
    var formatter = DateFormat.yMd();
    return formatter.format(date); // Tarihi belirli bir formata dönüştürür
  }
}
// e31d96a6-f15e-4787-ad2d-9d3965218523, Yemek, 50
// a975e32a-999b-47ac-ae73-929a66dd216c, Yemek, 50
// 28386049-6721-4bcb-adda-061a02020a42, Yemek, 50
// UUID , GUID => Benzersiz kimlik numarası
// Flutter'a paket ekleme

// Enums
// Enumerated Type

// Modelleme => Harcamalar için veri modeli
