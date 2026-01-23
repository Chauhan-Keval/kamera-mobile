import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/primary_button.dart';
import 'login_screen.dart';

class PasswordSuccessfullyUpdatedScreen extends StatelessWidget {
  const PasswordSuccessfullyUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Container(
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),

                        /// App Name
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

                        /// Success Icon
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color:
                                const Color(0xFF1677FF).withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: CircleAvatar(
                              radius: 36,
                              backgroundColor: Color(0xFF1677FF),
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
                          "Password Updated",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// Description
                        const Text(
                          "Your password has been changed successfully.\n"
                              "You can now use your new password to log in to your account.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6B7280),
                            height: 1.5,
                          ),
                        ),

                        const Spacer(), // ✅ NOW SAFE

                        /// Login Button
                        PrimaryButton(
                          title: "Go to Login",
                          icon: Icons.arrow_forward,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                                  (route) => false,
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        /// Help Link
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Need help?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1677FF),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
