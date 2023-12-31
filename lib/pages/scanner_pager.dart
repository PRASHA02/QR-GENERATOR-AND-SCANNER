import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "Not Scanned";

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'QR Code Scanner',
          style: TextStyle(
              color: Color.fromARGB(255, 228, 11, 239),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                "Scan QR Code",
                style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 228, 11, 239)),
                textAlign: TextAlign.center,
              ),
            ),
            // qr code image
            Container(
              padding:
                  const EdgeInsets.only(bottom: 30.0, left: 70.0, right: 70.0),
              child: const Image(
                image: AssetImage('assets/qr-code.jpg'),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              textAlign: TextAlign.center,
              "QR Code Result",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 228, 11, 239)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onLongPress: () {},
              child: SelectableText(
                qrCodeResult,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 228, 11, 239),
                ),
                cursorColor: Colors.red,
                showCursor: true,
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: true,
                  selectAll: true,
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              height: 68.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 228, 11, 239),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(
                      32.0,
                    ),
                  ),
                ),
                onPressed: () async {
                  ScanResult codeScanner = await BarcodeScanner.scan();
                  setState(
                    () {
                      qrCodeResult = codeScanner.rawContent;
                    },
                  ); //barcode scanner
                },
                child: const Text(
                  "Scan your QR Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
