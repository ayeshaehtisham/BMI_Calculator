// Screen to collect Height

import 'package:flutter/material.dart';
import 'package:project1/screens/weight_screen.dart';

class HeightPage extends StatefulWidget {
  final int age;
  final String gender;

  HeightPage({required this.age, required this.gender});

  @override
  _HeightPageState createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  double? _height; // No default height

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
        title: Text('Set Height', style: TextStyle(fontSize: 24 , color: const Color.fromARGB(255, 163, 118, 171))),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Height: ${_height != null ? _height!.toStringAsFixed(1) : ''} cm', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold)),
            Slider(
              value: _height ?? 160,
              min: 100,
              max: 220,
              divisions: 120,
              label: _height != null ? '${_height!.toStringAsFixed(1)} cm' : '160 cm',
              onChanged: (double value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the Gender and Age page
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_height == null) {
                      _showErrorDialog('Please Set Height First!');
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WeightPage(age: widget.age, gender: widget.gender, height: _height!)));
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}