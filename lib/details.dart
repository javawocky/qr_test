import 'package:flutter/material.dart';
import 'package:qr_trade/qrcodeform.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Your Details"),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(':'),
                    Expanded(
                      child: Text('Bob Sanders'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Phone',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(':'),
                    Expanded(
                      child: Text('0800838383'),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Credit',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(':'),
                    Expanded(
                      child: Text(r"$500"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Show QR Code'),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const QRCodeForm()),
                      // );

                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const QRCodeForm();
                        },
                      );
                    },
                  ),
                ),
              ]),
        ));
  }
}
