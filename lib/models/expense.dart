// expense.dart
import 'package:uuid/uuid.dart';

// UUID kütüphanesi için global bir örnek
const uuid = Uuid();

// Harcama kategorilerini belirleyen enum
enum Category { food, education, travel, work, other }

// Harcama sınıfı
class Expense {
  // Harcama sınıfının yapıcı metodu
  Expense({
    required this.name,         // Harcama adı
    required this.price,        // Harcama miktarı
    required this.date,         // Harcama tarihi
    required this.category,     // Harcama kategorisi
  }) : id = uuid.v4();          // Harcama kimliği (UUID ile oluşturulur)

  // Harcama özellikleri
  final String id;              // Harcama kimliği
  final String name;            // Harcama adı
  final double price;           // Harcama miktarı
  final DateTime date;          // Harcama tarihi
  final Category category;       // Harcama kategorisi
}
