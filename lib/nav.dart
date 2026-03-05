import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/screens/home_screen.dart';

class NavController extends GetxController {
  final currentIndex = 0.obs;

  void changeTab(int index) => currentIndex.value = index;
}

class Nav extends StatelessWidget {
  Nav({super.key});

  final NavController c = Get.put(NavController());

  final List<Widget> screens = const [
    HomePage(),
    ExplorePage(),
    CartPage(),
    FavoritePage(),
    NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(index: c.currentIndex.value, children: screens),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: c.currentIndex.value,
          onTap: c.changeTab,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          ],
        ),
      );
    });
  }
}

/* ---------------- PAGES ---------------- */

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F7FF),
      child: const Center(child: Text("Explore Page")),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFF7F0),
      child: const Center(child: Text("Cart Page")),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0FFF5),
      child: const Center(child: Text("Favorite Page")),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F0FF),
      child: const Center(child: Text("Notification Page")),
    );
  }
}
