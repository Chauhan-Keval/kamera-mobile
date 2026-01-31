import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:kamera/Screens/LoginScreen.dart';

import 'Screens/OnBordingScreen.dart';
import 'Screens/RegisterScreen.dart';
=======
import 'package:kamera/Screens/forgot_password_screen.dart';
import 'package:kamera/Screens/home_screen.dart';
import 'package:kamera/Screens/login_screen.dart';
import 'package:kamera/Screens/otp_verification_screen.dart';
import 'package:kamera/Screens/password_reset_screen.dart';
import 'package:kamera/Screens/password_successfully_updated_screen.dart';
import 'package:kamera/components/app_bottom_nav.dart';
import 'Screens/register_screen.dart';
>>>>>>> 5c1e84156d87fefcef7f64f2127229b3ca77b4c1
void main() {
  runApp(const KameraApp());
}

class KameraApp extends StatelessWidget {
  const KameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onbordingscreen(),
    );
  }
}


