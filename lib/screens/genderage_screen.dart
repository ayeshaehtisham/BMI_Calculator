// Screen to collect Gender & Age:

import 'package:flutter/material.dart';
import 'package:project1/screens/height_screen.dart';

class GenderAgePage extends StatefulWidget {
  @override
  _GenderAgePageState createState() => _GenderAgePageState();
}

class _GenderAgePageState extends State<GenderAgePage> {
  String? _selectedGender; // No default gender
  int? _age; // No default age

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
        title: Text(
          'Select Gender and Age',
          style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 163, 118, 171)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Gender", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            if (_selectedGender != null)
              Text(
                "Gender: $_selectedGender",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGender = "Male";
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: _selectedGender == "Male"
                          ? Colors.purple // Color when selected
                          : const Color.fromARGB(255, 163, 118, 171), // Default color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male, color: Colors.white),
                        SizedBox(height: 10),
                        Text("Male", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGender = "Female";
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: _selectedGender == "Female"
                          ? Colors.purple // Color when selected
                          : const Color.fromARGB(255, 163, 118, 171), // Default color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female, color: Colors.white),
                        SizedBox(height: 10),
                        Text("Female", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 80),
            Text(
              'Age: ${_age != null ? _age.toString() : ''} years',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _age != null ? _age!.toDouble() : 25,
              min: 1,
              max: 100,
              divisions: 90,
              label: _age != null ? '$_age' : '25',
              onChanged: (double value) {
                setState(() {
                  _age = value.toInt();
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous page
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedGender == null && _age == null) {
                      _showErrorDialog('Please enter Gender and Age first to proceed further.');
                    } else if (_selectedGender == null) {
                      _showErrorDialog('Please select Gender!');
                    } else if (_age == null) {
                      _showErrorDialog('Please enter Age!');
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HeightPage(age: _age!, gender: _selectedGender!),
                        ),
                      );
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
