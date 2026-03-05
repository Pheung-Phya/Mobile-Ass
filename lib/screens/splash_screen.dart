import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/constant/t_image.dart';
import 'package:mobile_project/screens/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final img = TImage();

    // Go to onboarding after 2 seconds (GetX navigation)
    Future.delayed(const Duration(seconds: 2), () {
      if (Get.isOverlaysClosed) {
        Get.offAll(() => const OnBoardingScreen());
      } else {
        // safe fallback
        Get.offAll(() => const OnBoardingScreen());
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F7),
      body: Center(
        child: Image.asset(img.splashIamge, width: 240, fit: BoxFit.contain),
      ),
    );
  }
}
