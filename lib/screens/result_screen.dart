// Screen to show the BMI result

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;

  ResultPage({required this.bmi});

  String _bmiCategory() {
    if (bmi < 18.5) return 'UnderWeight';
    if (bmi >= 18.5 && bmi <= 24.9) return 'Normal';
    if (bmi >= 25 && bmi <= 29.9) return 'OverWeight';
    return 'Obesity';
  }

  String _bmiTip() {
    if (bmi < 18.5) return 'You might want to increase your calorie intake and build muscle mass 💪🏻 ';
    if (bmi >= 18.5 && bmi <= 24.9) return 'Great! Keep maintaining your healthy lifestyle 👍🏻 ';
    if (bmi >= 25 && bmi <= 29.9) return 'Consider incorporating more physical activities and a balanced diet 🍎 ';
    return 'It is recommended to consult a healthcare provider for personalized advice 🧐 ';
  }

  Color _progressColor(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi >= 18.5 && bmi <= 24.9) return Colors.green;
    if (bmi >= 25 && bmi <= 29.9) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result', style: TextStyle(fontSize: 30 , color: const Color.fromARGB(255, 163, 118, 171))),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI is : ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Category: ${_bmiCategory()}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 163, 118, 171)),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: bmi / 40,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(_progressColor(bmi)),
            ),
            SizedBox(height: 20),
            Text(
              _bmiTip(),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: Text('Calculate Again'),
            )
          ],
        ),
      ),
    );
  }
}