import 'screens/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff090E21),
        appBarTheme: const AppBarTheme(
          color: Color(0xff090E21),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      home: const InputPage(),
    );
  }
}
