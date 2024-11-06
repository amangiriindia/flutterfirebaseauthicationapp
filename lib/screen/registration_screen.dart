import 'package:flutter/material.dart';
import 'package:incrementorstest/component/custom_appbar.dart';
import 'package:incrementorstest/component/custom_buttom.dart';
import 'package:incrementorstest/component/input_feild.dart';
import 'package:incrementorstest/component/input_feild_password.dart';
import 'package:incrementorstest/screen/get_started_screen.dart';
import 'package:incrementorstest/screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Controllers for the input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  // Toggle for password visibility
  bool _isPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          true, // Ensures that the content doesn't get hidden by the keyboard
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        // Wrap the body inside a SingleChildScrollView
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Account',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 28,
                fontWeight: FontWeight.w800,
                height: 40 / 28,
                color: Color(0xFF222741),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please fill in the form below to create an account. Easy isn\'t it?',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 24 / 16,
                color: Color(0xFF75788D),
              ),
            ),
            const SizedBox(height: 24),
            // Full Name Input
            buildInputField(
              controller: _nameController,
              hintText: 'Your full name',
            ),
            const SizedBox(height: 16),
            // Email Input
            buildInputField(
              controller: _emailController,
              hintText: 'Enter your email address',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            // Password Input
            buildPasswordField(
              controller: _passwordController,
              hintText: 'Password',
              isPasswordVisible: _isPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 16),
            // Repeat Password Input
            buildPasswordField(
              controller: _repeatPasswordController,
              hintText: 'Repeat Password',
              isPasswordVisible: _isRepeatPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  _isRepeatPasswordVisible = !_isRepeatPasswordVisible;
                });
              },
            ),

            // 'I already have an account' Text
            const SizedBox(height: 220),

            Center(
              child: TextButton(
                onPressed: () {
                  // Handle the action to redirect to login screen or any other action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text(
                  'I already have an account',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2355C4),
                    height: 24 / 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Create Account Button
            Center(
              child: CustomButton(
                backgroundColor: const Color(0xFF2355C4),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetStartedScreen()),
                  );
                },
                text: 'Create Account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
