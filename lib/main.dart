import 'package:flutter/material.dart';
import 'package:kamera/Screens/LoginScreen.dart';

import 'Screens/RegisterScreen.dart';
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


