// Screen to collect Weight

import 'package:flutter/material.dart';
import 'package:project1/screens/result_screen.dart';

class WeightPage extends StatefulWidget {
  final int age;
  final String gender;
  final double height;

  WeightPage({required this.age, required this.gender, required this.height});

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  double? _weight; // No default weight

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error ❗'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Weight', style: TextStyle(fontSize: 24 , color: const Color.fromARGB(255, 163, 118, 171))),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Weight: ${_weight != null ? _weight!.toStringAsFixed(1) : ''} kg', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold)),
            Slider(
              value: _weight ?? 60,
              min: 30,
              max: 150,
              divisions: 120,
              label: _weight != null ? '${_weight!.toStringAsFixed(1)} kg' : '60 kg',
              onChanged: (double value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the Height page
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_weight == null) {
                      _showErrorDialog('Please set Weight First!');
                    } else {
                      double bmi = _weight! / ((widget.height / 100) * (widget.height / 100));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(bmi: bmi)));
                    }
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}