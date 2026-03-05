import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/constant/t_image.dart';
import 'package:mobile_project/nav.dart';
import 'package:mobile_project/screens/home_screen.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;

  final images = TImage();

  late final List<_OnboardingItem> items = [
    _OnboardingItem(
      image: images.boarding1,
      title: "Welcome to the\nmost tastiest app",
      subtitle: "You know, this app is edible meaning you\ncan eat it!",
    ),
    _OnboardingItem(
      image: images.boarding2,
      title: "We use nitro on\nbicycles for delivery!",
      subtitle:
          "For very fast delivery we use nitro on\nbicycles, kidding, but we're very fast.",
    ),
    _OnboardingItem(
      image: images.boarding3,
      title: "We’re the besties\nof birthday peoples",
      subtitle:
          "We send cakes to our plus members. (only\none cake per person)",
    ),
  ];

  void onPageChanged(int index) => currentIndex.value = index;

  void next() {
    if (currentIndex.value < items.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      finish();
    }
  }

  void skip() => finish();

  void finish() {
    Get.offAll(() => Nav());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class _OnboardingItem {
  final String image;
  final String title;
  final String subtitle;

  _OnboardingItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
