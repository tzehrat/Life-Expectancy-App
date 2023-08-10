import 'package:flutter/material.dart';
import './input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LIFE EXPECTANCY',

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightGreen,
        primaryColor: Colors.lightGreen,
      ),

      // ),
      home: MyHomePage(title: 'LIFE EXPECTANCY'),
    );
  }
}
