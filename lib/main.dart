import 'package:flutter/material.dart';
import 'package:kamera/Screens/forgot_password_screen.dart';
import 'package:kamera/Screens/home_screen.dart';
import 'package:kamera/Screens/login_screen.dart';
import 'package:kamera/Screens/otp_verification_screen.dart';
import 'package:kamera/Screens/password_reset_screen.dart';
import 'package:kamera/Screens/password_successfully_updated_screen.dart';
import 'package:kamera/components/app_bottom_nav.dart';
import 'Screens/register_screen.dart';
void main() {
  runApp(const KameraApp());
}

class KameraApp extends StatelessWidget {
  const KameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


