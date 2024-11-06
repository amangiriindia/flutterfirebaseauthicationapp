import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Joby',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.01,
                color: Color(0xFF2355C4), // Color for "Joby"
              ),
            ),
            TextSpan(
              text: '.',
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
    );
  }

  // Define the preferred size for the custom app bar
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
