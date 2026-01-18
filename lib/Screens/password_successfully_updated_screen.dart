import 'package:flutter/material.dart';

import '../components/primary_button.dart';
import 'login_screen.dart';

class PasswordSuccessfullyUpdatedScreen extends StatelessWidget {
  const PasswordSuccessfullyUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF2FAFF),
              Color(0xFFE9F4FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // App Name
                const Text(
                  "KAMERA",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1677FF),
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 60),

                ///Success Icon
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF1677FF).withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor:Color(0xFF1677FF),
                      child: Icon(
                        Icons.check_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                /// Title
                const Text(
                  "Password Updated.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),

                const SizedBox(height: 16),

                //description
                const Text(
                  "Your password has been changed successfully. "
                      "You can now use your new password to log in to your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.5,
                  ),
                ),

                const Spacer(),

                // Login Button
                PrimaryButton(
                  title: "Go to Login",
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                ),

                const SizedBox(height: 20),

                // Help Link
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Need help?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1677FF)
                      ,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
