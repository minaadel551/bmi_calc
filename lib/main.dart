import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0A0D22), // for appBar
          scaffoldBackgroundColor: Color(0xff0A0D22)),
      home: InputPage(),
    );
  }
}
