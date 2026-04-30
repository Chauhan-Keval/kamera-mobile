import 'package:flutter/material.dart';
import 'package:kamera/Screens/login_screen.dart';
import 'Screens/OnBordingScreen.dart';

void main() {
  runApp(const KameraApp());
}

class KameraApp extends StatelessWidget {
  const KameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
