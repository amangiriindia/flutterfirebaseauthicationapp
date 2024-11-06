import 'package:flutter/material.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // AppBar height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Joby', // Text for "Joby"
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.01,
                    color: Color(0xFF2355C4), // Color for "Joby"
                  ),
                ),
                TextSpan(
                  text: '.', // Text for "."
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.01,
                    color: Color(0xFF59C1F2), // Color for "."
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
            _buildInputField(
              controller: _nameController,
              hintText: 'Your full name',
            ),
            const SizedBox(height: 16),
            // Email Input
            _buildInputField(
              controller: _emailController,
              hintText: 'Enter your email address',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            // Password Input
            _buildPasswordField(
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
            _buildPasswordField(
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
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to GetStartedScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetStartedScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2355C4),
                  minimumSize: const Size(327, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 24 / 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build input fields
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return Container(
      width: 327,
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Manrope',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF75788D),
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }

  // Helper method to build password input fields
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool isPasswordVisible,
    required VoidCallback togglePasswordVisibility,
  }) {
    return Container(
      width: 327,
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEFEFEF)),
      ),
      child: TextField(
        controller: controller,
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Manrope',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF75788D),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: const Color(0xFF75788D),
            ),
            onPressed: togglePasswordVisibility,
          ),
        ),
      ),
    );
  }
}
