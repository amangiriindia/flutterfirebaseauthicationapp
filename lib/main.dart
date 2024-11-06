import 'package:flutter/material.dart';
import 'package:incrementorstest/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core package

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding
  await Firebase.initializeApp(); // Initialize Firebase
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
