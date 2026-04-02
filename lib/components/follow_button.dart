import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final bool isFollowing;
  final VoidCallback onTap;

  const FollowButton({
    super.key,
    required this.isFollowing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          color: isFollowing ? Colors.transparent : const Color(0xFF1677FF),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xFF7DB7D1),
          ),
        ),
        child: Text(
          isFollowing ? "Following" : "Follow",
          style: TextStyle(
            color: isFollowing ? const Color(0xFF1677FF) : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}