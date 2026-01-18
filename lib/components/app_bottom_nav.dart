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
  int _currentIndex = 0;

  final List<Widget> _pages = [
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
        child: _pages[_currentIndex],
      ),
        bottomNavigationBar: _bottomNavBar()
    );
  }

  Widget _bottomNavBar() {
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
          _navItem(Icons.home, 0),
          _navItem(Icons.explore, 1),
          _navItem(Icons.group, 2),
          _navItem(Icons.bookmark_border, 3),
          _navItem(Icons.person_outline, 4),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
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




