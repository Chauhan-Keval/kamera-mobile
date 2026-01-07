import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamera/Screens/login_screen.dart';

import '../components/custom_textfield.dart';
import '../components/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            colors: [
              Color(0xFFEAF4FF),
              Color(0xFFD6E9FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 80),
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
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              Container(
                height: 550,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                  child: Column(
                    children: [
                      // Name
                      CustomTextField(
                        hint: "Full Name",
                        icon: Icons.person,
                      ),

                      const SizedBox(height: 20),

                      //Email
                      CustomTextField(
                        hint: "Email Address",
                        icon: Icons.email,
                      ),

                      const SizedBox(height: 20),

                      //Password
                      CustomTextField(
                        hint: "Password",
                        icon: Icons.lock,
                        isPassword: true,
                      ),

                      const SizedBox(height: 16),

                      // Terms
                      Row(
                        children: [
                          Checkbox(
                            value: agree,
                            activeColor: const Color(0xFF1677FF),
                            onChanged: (v) => setState(() => agree = v!),
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

                      //Register Button
                      PrimaryButton(
                        title: "Register",
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

                      const SizedBox(height: 30),

                      //Social Login
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
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("Already have an account? ",style: TextStyle(fontSize: 18),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Text(
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

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton(IconData icon,) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon, size: 25), const SizedBox(width: 6)],
    );
  }
}