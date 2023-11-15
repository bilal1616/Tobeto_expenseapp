import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // Text alanları için controller oluşturuluyor
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  // Seçili tarih, başlangıçta günümüz tarihiyle ayarlanıyor
  DateTime _date = DateTime.now();

  // Tarih değiştiğinde çağrılan fonksiyon
  void changeDateText(DateTime date) {
    setState(() {
      _date = date;
    });
  }

  // Kaydedilen tarihi tutmak için bir değişken tanımlanıyor
  String _savedDate = "";

  // **Kategori seçmek için bir değişken tanımlanıyor**
  String _category = "Kategori Seçin";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Harcamanın adını girmek için metin alanı
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Harcama Adı")),
          ),
          // Harcama miktarını girmek için metin alanı
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(label: Text("Miktar"), prefixText: "₺"),
          ),
          // Tarih seçmek için ikon düğmesi
          IconButton(
              onPressed: () async {
                // Kullanıcıya tarih seçimini gösteren pencereyi aç
                var date = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime(2050, 12, 31),
                );
                // Eğer kullanıcı bir tarih seçerse, tarihi güncelle
                if (date != null) {
                  changeDateText(date);
                }
              },
              icon: const Icon(Icons.calendar_month)),
          // Seçilen tarihi gösteren metin
          Text(DateFormat.yMd().format(_date)),
          // **Kategori seçmek için açılır liste**
          DropdownButton<String>(
            value: _category,
            hint: const Text("Kategori Seçin"),
            onChanged: (String? newValue) {
              setState(() {
                _category = newValue!;
              });
            },
            items: <String>[
              "Kategori Seçin", // Bu değer başlangıç değeri olarak kullanılıyor.
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
          // Kaydet butonu
          ElevatedButton(
              onPressed: () {
                // Kaydedilen harcamayı konsola yazdır
                print("Kayıt Başarılı: ${_nameController.text}");
                // Kaydedilen tarihi değişkene ata ve ekranda göster
                setState(() {
                  _savedDate = DateFormat.yMd().format(_date);
                });
                // **Kaydedilen kategoriyi konsola yazdır**
                print("Seçilen kategori: $_category");
              },
              child: const Text("Kaydet")),
          // Kaydedilen tarihi gösteren metin
          // Kaydedilen tarihi bir Card widget'ına yerleştir
          Card(
            color: Color.fromARGB(255, 247, 247, 247),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Harcama Adı: ${_nameController.text}",
                      style: TextStyle(color: Colors.black)),
                  Text("Miktar: ${_amountController.text} \₺",
                      style: TextStyle(color: Colors.black)),
                  Text("Seçilen tarih: $_savedDate",
                      style: TextStyle(color: Colors.black)),
                  // **Seçilen kategoriyi gösteren metin**
                  Text('Seçilen kategori: $_category',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
