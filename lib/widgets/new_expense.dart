import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/expense.dart';

// uuid kütüphanesinden Uuid sınıfını kullanarak rastgele bir ID oluşturuyoruz
const uuid = Uuid();

// Yeni bir harcama eklemek için kullanılan widget
class NewExpense extends StatefulWidget {
  // Constructor ile ana sayfa tarafından belirlenen bir fonksiyon alıyoruz
  const NewExpense({Key? key, required this.onAddExpense}) : super(key: key);

  // Ana sayfa tarafından belirlenen fonksiyonu tutan değişken
  final Function(Expense) onAddExpense;

  // State nesnesini oluşturan factory method
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

// Yeni harcama ekranının state nesnesi
class _NewExpenseState extends State<NewExpense> {
  // Form kontrolü için anahtar
  final _formKey = GlobalKey<FormState>();

  // Harcama adını tutan controller
  final _nameController = TextEditingController();

  // Harcama miktarını tutan controller
  final _amountController = TextEditingController();

  // Harcama tarihini tutan değişken
  DateTime _date = DateTime.now();

  // Harcama kategorisini tutan değişken
  String _category = "Kategori Seçin";

  // Tarih değiştiğinde bu metod kullanılarak güncellenir
  void _changeDateText(DateTime date) {
    setState(() {
      _date = date;
    });
  }

  // Tarih formatını düzenleyen metod
  String _formattedDate() {
    var formatter = DateFormat.yMd();
    return formatter.format(_date);
  }

  // Dropdown'dan seçilen kategori string'ini Expense sınıfındaki Category enum'ına çeviren metod
  Category _categoryFromString(String categoryName) {
    switch (categoryName) {
      case "food":
        return Category.food;
      case "education":
        return Category.education;
      case "travel":
        return Category.travel;
      case "expense":
        return Category.expense;
      default:
        return Category.food; // Varsayılan olarak food'u kullanabilirsiniz
    }
  }

  // Yeni harcamayı kaydeden metod
  void _saveExpense() {
    if (_formKey.currentState?.validate() ?? false) {
      // Expense sınıfını kullanarak yeni bir harcama nesnesi oluşturuyoruz
      Expense newExpense = Expense(
        name: _nameController.text,
        price: double.parse(_amountController.text),
        date: _date,
        category: _categoryFromString(_category),
      );

      // Ana sayfadaki onAddExpense fonksiyonunu çağırarak harcamayı ekliyoruz
      widget.onAddExpense(newExpense);

      // Controller'ları temizleyerek formu sıfırlıyoruz
      _nameController.clear();
      _amountController.clear();
      _category = "Kategori Seçin";

      // Yeni harcama ekranını kapatıyoruz
      Navigator.of(context).pop();
    }
  }

  // Widget'ın görüntüsünü oluşturan metod
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Harcama adını girmek için metin alanı
            TextFormField(
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text("Harcama Adı")),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen bir harcama adı girin';
                }
                return null;
              },
            ),
            // Harcama miktarını girmek için metin alanı
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(label: Text("Miktar"), prefixText: "₺"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen bir miktar girin';
                }
                return null;
              },
            ),
            // Tarih seçmek için kullanılan IconButton
            IconButton(
              onPressed: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime(2050, 12, 31),
                );
                if (date != null) {
                  _changeDateText(date);
                }
              },
              icon: const Icon(Icons.calendar_month),
            ),
            // Seçilen tarihi gösteren metin
            Text(_formattedDate()),
            // Harcama kategorisini seçmek için kullanılan DropdownButton
            DropdownButton<String>(
              value: _category,
              hint: const Text("Kategori Seçin"),
              onChanged: (String? newValue) {
                setState(() {
                  _category = newValue!;
                });
              },
              items: <String>[
                "Kategori Seçin",
                "food",
                "education",
                "travel",
                "expense"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            // Harcamayı kaydetmek için kullanılan buton
            ElevatedButton(
              onPressed: _saveExpense,
              child: const Text("Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}
