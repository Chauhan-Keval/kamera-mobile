import 'package:flutter/material.dart';

class PlaylistToggle extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const PlaylistToggle({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _btn("Private", 0),
        const SizedBox(width: 10),
        _btn("Public", 1),
      ],
    );
  }

  Widget _btn(String text, int index) {
    final selected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}