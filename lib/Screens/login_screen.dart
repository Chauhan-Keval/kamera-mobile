import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamera/Screens/forgot_password_screen.dart';
import 'package:kamera/Screens/register_screen.dart';

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF4FF), Color(0xFFD6E9FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                "KAMERA",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1677FF),
                ),
              ),
              const SizedBox(height: 0),
              const Text(
                "Your portal to cinema",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              SizedBox(height: 15),
              Container(
                height: 600,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      //Email
                      Text(
                        "Email Address",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        hint: "hello@kamera.app",
                        icon: Icons.email,
                      ),
                      SizedBox(height: 25),

                      //Password
                      Text(
                        "Password",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        hint: "Password",
                        icon: Icons.lock,
                        isPassword: true,
                      ),
                      SizedBox(height: 5),
                      //forget Password
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Color(0xFF1677FF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      //Login Button
                      PrimaryButton(
                        title: "Login",
                        onPressed: () {
                        },
                      ),


                      const SizedBox(height: 30),

                      //Divider
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

                      //Social Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          socialButton(FontAwesomeIcons.google, "Google"),
                          const SizedBox(width: 16),
                          socialButton(FontAwesomeIcons.apple, "Apple"),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              // Login Link
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Ragister Now ",
                        style: TextStyle(
                          color: Color(0xFF1677FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
