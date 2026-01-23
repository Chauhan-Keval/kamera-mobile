import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamera/Screens/login_screen.dart';
import 'package:kamera/components/app_bottom_nav.dart';

import '../components/custom_textfield.dart';
import '../components/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEAF4FF),
              Color(0xFFD6E9FF),
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
                      children: [
                        const SizedBox(height: 60),

                        // App Name
                        const Text(
                          "KAMERA",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1677FF),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Create your account to start watching.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Register Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 30,
                          ),
                          child: Column(
                            children: [
                              CustomTextField(
                                hint: "Full Name",
                                icon: Icons.person,
                              ),

                              const SizedBox(height: 20),

                              CustomTextField(
                                hint: "Email Address",
                                icon: Icons.email,
                              ),

                              const SizedBox(height: 20),

                              CustomTextField(
                                hint: "Password",
                                icon: Icons.lock,
                                isPassword: true,
                              ),

                              const SizedBox(height: 16),

                              Row(
                                children: [
                                  Checkbox(
                                    value: agree,
                                    activeColor: const Color(0xFF1677FF),
                                    onChanged: (v) =>
                                        setState(() => agree = v ?? false),
                                  ),
                                  const Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        text: "I agree to the ",
                                        children: [
                                          TextSpan(
                                            text: "Terms",
                                            style: TextStyle(
                                              color: Color(0xFF1677FF),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          TextSpan(text: " & "),
                                          TextSpan(
                                            text: "Privacy Policy",
                                            style: TextStyle(
                                              color: Color(0xFF1677FF),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              PrimaryButton(
                                title: "Register",
                                onPressed: agree
                                    ? () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                      const AppBottomNav(),
                                    ),
                                  );
                                }
                                    : null,
                              ),

                              const SizedBox(height: 30),

                              Row(
                                children: const [
                                  Expanded(child: Divider()),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      "Or continue with",
                                      style:
                                      TextStyle(color: Colors.black45),
                                    ),
                                  ),
                                  Expanded(child: Divider()),
                                ],
                              ),

                              const SizedBox(height: 30),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  socialButton(FontAwesomeIcons.google),
                                  const SizedBox(width: 35),
                                  socialButton(FontAwesomeIcons.apple),
                                  const SizedBox(width: 35),
                                  socialButton(FontAwesomeIcons.facebook),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 35),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Color(0xFF1677FF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
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

  Widget socialButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 24),
    );
  }
}
