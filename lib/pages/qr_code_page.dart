import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodePage extends StatefulWidget {
  QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String ticket = '';
  List<String> tickets = [];

  // readQRCode() async {
  //   String code = await FlutterBarcodeScanner.scanBarcode(
  //     '#FFFFFF',
  //     'Cancel',
  //     false,
  //     ScanMode.QR,
  //   );
  //   setState(() => ticket = code != '-1' ? code : 'Não validado');
  // }

  readQRCode() async {
    Stream<dynamic>? reader = FlutterBarcodeScanner.getBarcodeStreamReceiver(
      '#FFFFFF',
      'Cancel',
      false,
      ScanMode.QR, //Scan.BARCODE para código de barras
    );
    if (reader != null)
      reader.listen(
        (code) {
          setState(() {
            if (!tickets.contains(code.toString()) && code != '-1')
              tickets.add(code.toString());
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //para ler um único code utiliza o if abaixo:
            // if (ticket != '')
            Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: Text(
                //para ler um único code:
                // 'Ticket: $ticket',
                //para ler vários codes:
                'Tickets:${tickets.length} ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton.icon(
              onPressed: readQRCode,
              icon: Icon(Icons.qr_code),
              label: Text('Validar'),
            )
          ],
        ),
      ),
    );
  }
}
