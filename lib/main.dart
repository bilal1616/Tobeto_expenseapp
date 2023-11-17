// 'expenseapp/pages/main_page.dart' dosyasından 'MainPage' sınıfını içeriye dahil ediyoruz.
import 'package:expenseapp/pages/main_page.dart';
// Flutter SDK'dan 'material.dart' kütüphanesini dahil ediyoruz.
import 'package:flutter/material.dart';
// Programın başlangıcında çalıştırılacak kodlar buraya yazılır

void main() {
  // Uygulama başlatılırken temel material 3 teması kullanılarak ana sayfa oluşturulur.
  runApp(
    MaterialApp(
      // Uygulamanın genel tema ayarlarını içerir.
      theme: ThemeData(useMaterial3: true),
      // Uygulamanın başlangıç noktasını belirten ana sayfa. Bu durumda 'MainPage'.
      home: const MainPage(),
      // Hata ayıklama modunda ekranın sağ üst köşesindeki "Debug" yazısını kapatır.
      debugShowCheckedModeBanner: false,
    ),
  );
}

// Modelleme => Uygulamada çalışacak yapıların nesne haline getirilmesi