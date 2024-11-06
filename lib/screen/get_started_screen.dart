import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:incrementorstest/component/custom_buttom.dart';


class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  String userName = "User"; // Default name

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          setState(() {
            userName = userDoc.data()?['name'] ?? "User";
          });
        }
      }
    } catch (e) {
      print("Error fetching user name: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2355C4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Image.asset(
            'assets/icon/icon.png',
            width: 128,
            height: 128,
          ),
          SizedBox(height: 40),
          Text(
            'Congratulations\n$userName\nYour account has been\nset up!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Manrope',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 40 / 28,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          const Text(
            'We have customized feeds according to \nyour preferences.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
              color: Color(0xFFD2E4FC),
            ),
          ),
          Spacer(flex: 4),
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
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
