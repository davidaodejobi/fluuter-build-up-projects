import 'package:flutter/material.dart';
import 'package:note_app/utils/app_theme.dart';
import 'package:note_app/views/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkMode(),
      home: Home(),
    );
  }
}
