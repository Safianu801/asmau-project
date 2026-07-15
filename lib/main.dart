import 'package:first_project/screens/accounts_screen.dart';
import 'package:first_project/screens/billing_settings_screen.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/screens/order_screen.dart';
import 'package:first_project/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF1E3A8A),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        useMaterial3: true
      ),

      themeMode: ThemeMode.system,

      home:AccountsScreen() ,

    );
  }
}
