import 'package:expenseapp/pages/expense_list.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenseapp/models/expense.dart';

// Ana Sayfa Widget'ı
class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

// Ana Sayfa'nın State'i
class _MainPageState extends State<MainPage> {
  // Dark Mode durumunu tutan değişken
  bool _isDarkModeEnabled = false;

  // Gider listesi
  final List<Expense> expenses = [
    Expense(
      name: "Yiyecek",
      price: 250,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      name: "Flutter Udemy Kursu",
      price: 1500,
      date: DateTime.now(),
      category: Category.education,
    ),
    Expense(
        name: "Uzakdoğu Turu",
        price: 50000,
        date: DateTime.now(),
        category: Category.travel)
  ];

  // Yeni gider ekleyen metod
  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  // Gideri kaldıran metod
  void removeExpense(Expense expense) {
    final removedExpenseIndex = expenses.indexOf(expense);

    // Kullanıcıya giderin silindiği bir SnackBar göster
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Expense Deleted!",
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
        action: SnackBarAction(
          textColor: Colors.red,
          label: "Undo",
          onPressed: () {
            setState(() {
              expenses.insert(removedExpenseIndex, expense);
            });
          },
        ),
      ),
    );

    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Dark Mode durumuna göre tema seçimi
      data: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          // Başlık ve Dark Mode anahtarı içeren app bar
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Dark Mode anahtarını kontrol eden Switch
              Switch(
                value: _isDarkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _isDarkModeEnabled = value;
                  });
                },
                activeTrackColor: Theme.of(context).colorScheme.primary,
                activeColor: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 55),
              const Center(child: Text("Expense App")),
            ],
          ),
          // Sağ üst köşede Yeni Gider Ekle butonu
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) => NewExpense(
                    onAdd: (expense) => addExpense(expense),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        // Ana ekranın gövdesi, ExpenseList widget'ı ile gösterilen gider listesi
        body: ExpenseList(expenses, removeExpense),
      ),
    );
  }
}
