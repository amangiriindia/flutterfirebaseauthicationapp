import 'package:flutter/material.dart';
import 'package:incrementorstest/screen/registration_screen.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Start the navigation after a 3 second delay
    Future.delayed(const Duration(seconds: 3), () {
      // Redirect to RegistrationPage after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegistrationScreen()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF2355C4),  // Background color: #2355C4
      body: Stack(
        children: [
          // Icon centered with specified position
          Positioned(
            top: 160,
            left: 124,
            child: Image.asset(
              'assets/icon/icon.png',
              width: 128,
              height: 128,
            ),
          ),
          // Text with the specified style
          Positioned(
            top: 320,
            left: 0,
            right: 0,
            child: Center(
              child: const Text(
                'Splash Screen',
                style: TextStyle(
                  fontFamily: 'Manrope',  // Font family Manrope
                  fontSize: 28,
                  fontWeight: FontWeight.w800,  // Font weight 800
                  height: 40 / 28,  // line-height: 40px, based on font-size 28px
                  color: Colors.white,  // Text color white
                ),
              ),
            ),
          ),

          
        ],
      ),
    );
  }
}
