import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/controllers/on_boarding_controller.dart';

class OnBoardingScreen extends GetView<OnboardingController> {
  const OnBoardingScreen({super.key});

  static const Color primary = Color(0xFF4CAF50);
  static const Color soft = Color(0xFFE9F3E7);
  static const Color text = Color(0xFF2F2F2F);
  static const Color subText = Color(0xFF7A7A7A);

  @override
  Widget build(BuildContext context) {
    // Put controller here (simple one-file usage)
    Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 14),
            const Text(
              "Banhjok",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: text,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.items.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, i) {
                  final item = controller.items[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        Expanded(
                          child: Center(
                            child: Image.asset(
                              item.image,
                              height: 300,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const SizedBox(height: 6),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            height: 1.15,
                            color: text,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12.5,
                            height: 1.45,
                            color: subText,
                          ),
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
              child: Column(
                children: [
                  Obx(
                    () => _Dots(
                      count: controller.items.length,
                      activeIndex: controller.currentIndex.value,
                    ),
                  ),
                  const SizedBox(height: 14),

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: soft,
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: controller.skip,
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: controller.next,
                            child: Obx(() {
                              final isLast =
                                  controller.currentIndex.value ==
                                  controller.items.length - 1;
                              return Text(
                                isLast ? "Start" : "Next",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ====== Dots indicator ======
class _Dots extends StatelessWidget {
  final int count;
  final int activeIndex;

  const _Dots({required this.count, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 18 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: active ? const Color(0xFF4CAF50) : const Color(0xFFDCE7DC),
            borderRadius: BorderRadius.circular(99),
          ),
        );
      }),
    );
  }
}
