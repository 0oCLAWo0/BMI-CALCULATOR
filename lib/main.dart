import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090C22),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF090C22),
        ),
      ),
    );
  }
}
