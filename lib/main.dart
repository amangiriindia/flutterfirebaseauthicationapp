import 'package:flutter/material.dart';
import 'package:incrementorstest/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tedcom App',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF2355C4), // Set primary color here
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(
              0xFF2355C4), // Define a color scheme based on primary color
        ),
      ),
      home: SplashScreen(),
    );
  }
}
