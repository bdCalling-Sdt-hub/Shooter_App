import 'package:flutter/material.dart';
import 'package:shooter_app/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shooter app',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
    );
  }
}
