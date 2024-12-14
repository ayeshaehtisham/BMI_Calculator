// Main Screen - Displays title and image

import 'package:flutter/material.dart';
import 'package:project1/screens/genderage_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: TextStyle(fontSize: 30 , color: const Color.fromARGB(255, 163, 118, 171))),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions_run_sharp, size: 55, color: Colors.purple),  // Running man icon
                SizedBox(width: 10),
                Text(
                  'Welcome to BMI Calculator ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 163, 118, 171)),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GenderAgePage()));
              },
              child: Text('Start BMI Calculation'),
            ),
          ],
        ),
      ),
    );
  }
}