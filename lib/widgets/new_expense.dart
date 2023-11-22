import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Yeni gider ekranı için Stateful Widget
class NewExpense extends StatefulWidget {
  const NewExpense({Key? key, required this.onAdd}) : super(key: key);

  // Ana ekrana eklenen yeni gideri bildiren callback fonksiyonu
  final void Function(Expense expense) onAdd;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // Text alanları için controller'lar
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  // Seçilen tarih ve kategori
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  // Tarih seçiciyi açan metod
  void _openDatePicker() async {
    DateTime now = DateTime.now();
    DateTime startDate = DateTime(1970, 1, 1);
    DateTime endDate = DateTime(2099, 12, 31);

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate == null
          ? now
          : _selectedDate!, // Eğer seçili tarih varsa onu kullan, yoksa günün tarihini kullan.
      firstDate: startDate,
      lastDate: endDate,
    );

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  // Yeni gider eklemeyi gerçekleştiren metod
  void _addNewExpense() {
    final amount = double.tryParse(_amountController.text);

    // Geçerli bir miktar, isim ve tarih kontrolü
    if (amount == null ||
        amount < 0 ||
        _nameController.text.isEmpty ||
        _selectedDate == null) {
      // Hata durumunda uyarı göster
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Validation Error"),
              content: const Text("Please fill in all blank fields."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("Ok"))
              ],
            );
          });
    } else {
      // Geçerli durumda yeni gider oluştur ve ana ekrana bildir
      Expense expense = Expense(
          name: _nameController.text,
          price: amount,
          date: _selectedDate!,
          category: _selectedCategory);
      widget.onAdd(expense);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Gider adı giriş alanı
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Expense Name")),
          ),

          // Gider miktarı ve tarih giriş alanları
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Amount"), prefixText: "₺"),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => _openDatePicker(),
                        icon: const Icon(Icons.calendar_month)),
                    // Ternary Operator
                    Text(_selectedDate == null
                        ? "Tarih Seçiniz"
                        : DateFormat.yMd().format(_selectedDate!)),
                  ],
                ),
              ),
            ],
          ),

          // Kategori seçici dropdown
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name.toString()));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) _selectedCategory = value;
                    });
                  })
            ],
          ),

          // Boşluk bırakma
          const Spacer(),

          // Vazgeç ve Kaydet butonları
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Vazgeç")),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    _addNewExpense();
                  },
                  child: const Text("Kaydet")),
            ],
          )
        ],
      ),
    );
  }
}
