import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeForm extends StatefulWidget {
  const QRCodeForm({Key? key}) : super(key: key);

  @override
  State<QRCodeForm> createState() => _QRCodeFormState();
}

class _QRCodeFormState extends State<QRCodeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Scan this QR Code"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: QrImageView(
                    data: "bazinga",
                    version: QrVersions.auto,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.black,
                    ),
                    size: 300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
