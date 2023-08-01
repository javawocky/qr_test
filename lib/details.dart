import 'package:flutter/material.dart';
import 'package:qr_trade/qrcodeform.dart';
import 'resetpin.dart';

class Details extends StatefulWidget {
  final Map<String, String> nameValuePair;

  const Details(this.nameValuePair, {Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final List<Map<String, String>> _detailsList = [
    {'Name': 'Bob Sanders'},
    {'Address': '67 Corinthian Drive'},
    {'Company Name': 'Support Centre LTD'},
    {'Phone': '0800838383'},
    {'Credit': r'$5001.21'},
    // Add more key-value pairs as needed
  ];

  @override
  Widget build(BuildContext context) {
    String name = widget.nameValuePair['name'] ??
        ''; // Get the 'name' value from the nameValuePair

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Your Details $name"), // Concatenate the name to the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            for (var detail in _detailsList)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      detail.keys.first,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(':'),
                  Expanded(
                    child: Text(detail.values.first),
                  ),
                ],
              ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Show QR Code'),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const QRCodeForm();
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ), // Add the desired gap between the buttons
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Reset PIN'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPinForm()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
