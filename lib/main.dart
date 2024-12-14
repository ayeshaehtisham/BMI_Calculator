import 'package:flutter/material.dart';
import 'package:project1/screens/home_screen.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(primaryColor: Colors.white, scaffoldBackgroundColor: Color.fromARGB(255, 216, 209, 218)),
      home: HomeScreen(),
    );
  }
}
