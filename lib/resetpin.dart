import 'package:flutter/material.dart';

class ResetPinForm extends StatefulWidget {
  @override
  State<ResetPinForm> createState() => _ResetPinFormState();
}

class _ResetPinFormState extends State<ResetPinForm> {
  final _pinController = TextEditingController();

  bool _isButtonEnabled = false;
  bool _pinUpdated = false;

  @override
  void initState() {
    super.initState();
    _pinController.addListener(_onPinChanged);
  }

  @override
  void dispose() {
    _pinController.removeListener(_onPinChanged);
    _pinController.dispose();
    super.dispose();
  }

  void _onPinChanged() {
    setState(() {
      _isButtonEnabled = _pinController.text.length == 6;
    });
  }

  void _showPinUpdatedSnackBar() {
    setState(() {
      _pinUpdated = true;
    });

    // Show the snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your PIN has been updated.'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            // Navigate back to the previous page when "OK" button is pressed
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredWidth = screenWidth * 0.9; // Adjust this value as needed

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Reset PIN Code"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: desiredWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Add your desired border color
                  width: 2.0, // Add your desired border width
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Please enter a 6 digit pin',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context)
                        .primaryColor, // Add your desired label text color
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Update PIN'),
                onPressed: _isButtonEnabled
                    ? () {
                        // TODO: Implement your logic for updating the PIN here
                        _showPinUpdatedSnackBar();
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
