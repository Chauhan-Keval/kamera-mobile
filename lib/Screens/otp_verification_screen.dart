import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:kamera/Screens/password_reset_screen.dart';
import '../components/primary_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> controllers =
  List.generate(4, (_) => TextEditingController());

  Timer? _timer;
  int seconds = 45;
  bool isOtpComplete = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    seconds = 45;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Fix Android black bottom bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),

                        /// Back button
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon:
                            const Icon(Icons.arrow_back_ios_new_rounded),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// Icon
                        Container(
                          width: 110,
                          height: 110,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDCEEFF),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.mark_email_read_rounded,
                            size: 50,
                            color: Color(0xFF1677FF),
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// Title
                        const Text(
                          "OTP Verification",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// Subtitle
                        Text(
                          "We've sent a 4-digit verification\ncode to ${widget.email}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6B7280),
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// OTP boxes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: 64,
                              height: 64,
                              child: TextField(
                                controller: controllers[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty && index < 3) {
                                    FocusScope.of(context).nextFocus();
                                  }

                                  setState(() {
                                    isOtpComplete = controllers
                                        .every((c) => c.text.isNotEmpty);
                                  });
                                },
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 30),

                        const Text(
                          "Don't receive the code?",
                          style: TextStyle(color: Color(0xFF6B7280)),
                        ),

                        const SizedBox(height: 6),

                        GestureDetector(
                          onTap: seconds == 0 ? startTimer : null,
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: seconds == 0
                                  ? const Color(0xFF1677FF)
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// Timer
                        Text(
                          "00:${seconds.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// Verify Button
                        PrimaryButton(
                          title: "Verify",
                          icon: Icons.arrow_forward,
                          backgroundColor: isOtpComplete
                              ? const Color(0xFF1677FF)
                              : const Color(0xFFBFDFFF),
                          onPressed: isOtpComplete
                              ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const PasswordResetScreen(),
                              ),
                            );
                          }
                              : null,
                        ),

                        const Spacer(), // ✅ pushes content correctly

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
}
