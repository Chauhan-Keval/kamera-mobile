import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamera/Screens/forgot_password_screen.dart';
import 'package:kamera/Screens/register_screen.dart';
import 'package:kamera/components/app_bottom_nav.dart';

import '../components/custom_textfield.dart';
import '../components/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool agree = false;
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF4FF), Color(0xFFD6E9FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 40),

              // Logo
              Text(
                "KAMERA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1677FF),
                ),
              ),
              const Text(
                "Your portal to cinema",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),

              const SizedBox(height: 20),

              // Login Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // Email
                    const Text("Email Address"),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: "hello@kamera.app",
                      icon: Icons.email,
                    ),

                    const SizedBox(height: 25),

                    // Password
                    const Text("Password"),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: "Password",
                      icon: Icons.lock,
                      isPassword: true,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ForgotPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Color(0xFF1677FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Login Button
                    PrimaryButton(
                      title: "Login",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AppBottomNav(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 25),

                    // Divider
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Social Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialButton(FontAwesomeIcons.google, "Google"),
                        const SizedBox(width: 16),
                        socialButton(FontAwesomeIcons.apple, "Apple"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        color: Color(0xFF1677FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );

  }

  Widget socialButton(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon, size: 25), const SizedBox(width: 6), Text(label)],
    );
  }
}
