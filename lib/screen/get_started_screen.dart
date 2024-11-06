import 'package:flutter/material.dart';
import 'package:incrementorstest/component/custom_buttom.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2355C4), // Background color: #2355C4
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the content vertically
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center the content horizontally
        children: [
          // Image at the top
          Spacer(
            flex: 2,
          ),
          Image.asset(
            'assets/icon/icon.png',
            width: 128,
            height: 128,
          ),
          SizedBox(height: 40), // Add space between the image and the text

          // Text for Username and account setup
          const Text(
            'Congratulations\nAman Giri\nYour account has been\nset up!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Manrope', // Font family Manrope
              fontSize: 28,
              fontWeight: FontWeight.w800, // Font weight 800
              height: 40 / 28, // line-height: 40px, based on font-size 28px
              color: Colors.white, // Text color white
            ),
          ),
          SizedBox(
              height:
                  20), // Add space between the account setup text and the next text

          // Text for customized feeds
          const Text(
            'We have customized feeds according to \nyour preferences.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
              color: Color(0xFFD2E4FC), // Text color #D2E4FC
            ),
          ),

          Spacer(
            flex: 4,
          ),
          // Get Started Button
          Center(
            child: CustomButton(
              backgroundColor: const Color(0xFF59C1F2),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetStartedScreen()),
                );
              },
              text: 'Get Started',
            ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
