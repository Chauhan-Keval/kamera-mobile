import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamera/Screens/LoginScreen.dart';

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

              // Name
              buildTextField(
                hint: "Full Name",
                icon: Icons.person,
              ),

              const SizedBox(height: 20),

              //Email
              buildTextField(
                hint: "Email Address",
                icon: Icons.email,
              ),

              const SizedBox(height: 20),

              //Password
              buildTextField(
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
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1677FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 8,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                  socialButton(FontAwesomeIcons.google),
                  const SizedBox(width: 16),
                  socialButton(FontAwesomeIcons.apple),
                  const SizedBox(width: 16),
                  socialButton(FontAwesomeIcons.facebook),
                ],
              ),

              const SizedBox(height: 30),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("Already have an account? ",style: TextStyle(fontSize: 16),),
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
  Widget buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword ? hidePassword : false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black45),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() => hidePassword = !hidePassword);
            },
          )
              : null,
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
  Widget socialButton(IconData icon) {
    return CircleAvatar(
      radius: 26,
      backgroundColor: Colors.white,
      child: Icon(icon, size: 28),
    );
  }
}