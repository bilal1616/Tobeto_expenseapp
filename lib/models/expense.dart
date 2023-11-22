// flutter/material ve intl paketlerini içeri aktar
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// uuid paketini içeri aktar
import 'package:uuid/uuid.dart';

// uuid instance'ı oluştur
const uuid = Uuid();

// Kategori seçeneklerini içeren enum tanımla
enum Category { food, education, travel, work }

// Kategoriye göre simgeleri içeren bir map oluştur
const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.education: Icons.cast_for_education,
  Category.travel: Icons.travel_explore_outlined,
  Category.work: Icons.business
};

// Gider sınıfı
class Expense {
  // Constructor (kurucu metod) ile gider öğesi oluşturulur
  Expense({
    required this.name,
    required this.price,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // uuid kullanarak benzersiz bir kimlik oluştur

  // Giderin kimliği (id)
  final String id;

  // Giderin adı
  final String name;

  // Giderin fiyatı
  final double price;

  // Giderin tarihi
  final DateTime date;

  // Giderin kategorisi
  final Category category;

  // Tarih formatını düzenleyen özel bir getter metodu
  String get formattedDate {
    var formatter = DateFormat.yMd();
    return formatter.format(date);
  }
}
