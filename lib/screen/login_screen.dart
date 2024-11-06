import 'package:flutter/material.dart';
import 'package:incrementorstest/component/custom_appbar.dart';
import 'package:incrementorstest/component/custom_buttom.dart';
import 'package:incrementorstest/component/input_feild.dart';
import 'package:incrementorstest/component/input_feild_password.dart';
import 'package:incrementorstest/screen/get_started_screen.dart';
import 'package:incrementorstest/screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 28,
                fontWeight: FontWeight.w800,
                height: 40 / 28,
                color: Color(0xFF222741),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'It is quick and easy to log in. Enter your email\nand password below.',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 24 / 16,
                color: Color(0xFF75788D),
              ),
            ),
            const SizedBox(height: 24),
            buildInputField(
              controller: _emailController,
              hintText: 'Enter your email address',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 3),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle Forgot Password action
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF222741),
                    height: 24 / 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 160),
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle the action to redirect to login screen or any other action
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()),
                  );
                },
                child: const Text(
                  'I don’t have an account',
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
            Center(
              child: CustomButton(
                backgroundColor: const Color(0xFF2355C4),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetStartedScreen()),
                  );
                },
                text: 'Login',
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(color: Color(0xFFDCDDDF)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFACAEBE),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: Color(0xFFDCDDDF)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Google Login action
                },
                icon: Image.asset(
                  'assets/icon/google_icon.png', // Make sure to add the Google logo to assets
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  'Login with Google',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF75788D),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEFEFEF),
                  minimumSize: const Size(327, 56),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
