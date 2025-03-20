import 'package:flutter/material.dart';
import 'package:task_1_ios_app/screens/home_screen/home_screen.dart';
import 'package:task_1_ios_app/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LogInScreen(),
    );
  }
}
