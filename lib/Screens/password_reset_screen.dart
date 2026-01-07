import 'package:flutter/material.dart';
import 'package:kamera/Screens/password_successfully_updated_screen.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  bool hideNew = true;
  bool hideConfirm = true;

  final TextEditingController newPassCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  bool hasMinLength = false;
  bool hasNumber = false;

  void validatePassword(String value) {
    setState(() {
      hasMinLength = value.length >= 8;
      hasNumber = RegExp(r'\d').hasMatch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // Back
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 40),


                ///Title
                const Center(
                  child: Text(
                    "New Password",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1677FF),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Subtitle
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Your new password must be different from previously used passwords.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6B7280),
                        height: 1.5,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // New Password
                const Text(
                  "New Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF374151),
                  ),
                ),
                const SizedBox(height: 8),

                buildPasswordField(
                  controller: newPassCtrl,
                  hint: "Create new password",
                  isHidden: hideNew,
                  toggle: () => setState(() => hideNew = !hideNew),
                  onChanged: validatePassword,
                ),

                const SizedBox(height: 24),

                // Confirm Password
                const Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF374151),
                  ),
                ),
                const SizedBox(height: 8),

                buildPasswordField(
                  controller: confirmPassCtrl,
                  hint: "Confirm your password",
                  isHidden: hideConfirm,
                  toggle: () => setState(() => hideConfirm = !hideConfirm),
                ),

                const SizedBox(height: 30),

                // Requirements
                const Text(
                  "PASSWORD REQUIREMENTS:",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.2,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                requirementRow("At least 8 characters", hasMinLength),
                const SizedBox(height: 8),
                requirementRow("Contains a number", hasNumber),

                const SizedBox(height: 40),

                ///  Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1677FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10,
                    ),
                    onPressed: () {

                      if (!hasMinLength || !hasNumber) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Password does not meet requirements"),
                          ),
                        );
                        return;
                      }

                      if (newPassCtrl.text != confirmPassCtrl.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Passwords do not match"),
                          ),
                        );
                        return;
                      }

                      if(newPassCtrl.text == confirmPassCtrl.text){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PasswordSuccessfullyUpdatedScreen()));
                      }

                      // Update password API here
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Update Password",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Text Field
  Widget buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool isHidden,
    required VoidCallback toggle,
    Function(String)? onChanged,
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
        controller: controller,
        obscureText: isHidden,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon:
            Icon(isHidden ? Icons.visibility_off : Icons.visibility_outlined),
            onPressed: toggle,
          ),
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  Widget requirementRow(String text, bool success) {
    return Row(
      children: [
        Icon(
          success ? Icons.check_circle : Icons.radio_button_unchecked,
          color: success ? Colors.green : Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: success ? Colors.green : Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
