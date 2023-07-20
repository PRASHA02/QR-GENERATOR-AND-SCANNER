import 'package:flutter/material.dart';
import 'package:individual/pages/scanner_pager.dart';

import 'generator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'QR Code Generator and Scanner',
          style: TextStyle(
              color: Color.fromARGB(255, 228, 11, 239),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(50, 50, 50, 70),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/qr.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Welcome to QR World",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 228, 11, 239),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Text("You can Generate or Scan QR Code",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 228, 11, 239)),
                  textAlign: TextAlign.center),
              const SizedBox(height: 10.0),
              const Image(
                image: AssetImage('assets/i3.jpg'),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Button(
                'Scan QR Code',
                const ScanPage(),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Button(
                'Generate QR Code',
                const GenerateQrCodePage(),
              ),
              const SizedBox(
                height: 80.0,
              ),
              const Text(
                "Developed by Prashanth D",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 228, 11, 239)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Button(String text, Widget widget) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      height: 60.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 228, 11, 239),
          backgroundColor: Color.fromARGB(255, 253, 252, 253),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
