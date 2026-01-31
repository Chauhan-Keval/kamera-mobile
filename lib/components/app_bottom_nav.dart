import 'package:flutter/material.dart';

import '../Screens/bookmark_screen.dart';
import '../Screens/discover_people_screen.dart';
import '../Screens/explore_screen.dart';
import '../Screens/home_screen.dart';
import '../Screens/profile_screen.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({super.key});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const DiscoverPeopleScreen(),
    const BookmarkScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: pages[currentIndex],
      ),
        bottomNavigationBar: bottomNavBar()
    );
  }

  Widget bottomNavBar() {
    return Container(
      height: 72,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(Icons.home, 0),
          navItem(Icons.explore, 1),
          navItem(Icons.group, 2),
          navItem(Icons.bookmark_border, 3),
          navItem(Icons.person_outline, 4),
        ],
      ),
    );
  }

  Widget navItem(IconData icon, int index) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            child: Icon(
              icon,
              size: isSelected ? 30 : 26,
              color: isSelected
                  ? const Color(0xFF1677FF)
                  : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 4,
            width: isSelected ? 12 : 0,
            decoration: BoxDecoration(
              color: const Color(0xFF1677FF),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }


}




