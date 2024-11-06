import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:incrementorstest/component/custom_appbar.dart';
import 'package:incrementorstest/component/custom_buttom.dart';
import 'package:incrementorstest/component/input_feild.dart';
import 'package:incrementorstest/component/input_feild_password.dart';
import 'package:incrementorstest/screen/get_started_screen.dart';
import 'package:incrementorstest/screen/registration_screen.dart';
import '../component/forget_password_popup.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _errorMessage;

  // Method to show the Forgot Password dialog

  // Method to show Snackbar for feedback
  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return null; // The user canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e); // Handle error appropriately
      return null;
    }
  }

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
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            const SizedBox(height: 3),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => showForgotPasswordDialog(
                    context), // Open Forgot Password dialog
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
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GetStartedScreen()),
                    );
                  } catch (e) {
                    setState(() {
                      _errorMessage = "Invalid email or password.";
                    });
                  }
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
                onPressed: () async {
                  User? user = await _signInWithGoogle();
                  if (user != null) {
                    // Navigate to next screen after successful sign-in
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GetStartedScreen()),
                    );
                  } else {
                    // Show an error message or snack bar if sign-in fails
                    print('google sign feild');
                  }
                },
                icon: Image.asset(
                  'assets/icon/google_icon.png', // Ensure the Google logo is added to assets
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
            )
          ],
        ),
      ),
    );
  }
}
