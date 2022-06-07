import 'package:flutter/material.dart';
import 'package:flutter_qrcode_page/pages/qr_code_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Project',
      theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey[900],
          elevatedButtonTheme:
              ElevatedButtonThemeData(style: ElevatedButton.styleFrom())),
      home: QRCodePage(),
    );
  }
}
