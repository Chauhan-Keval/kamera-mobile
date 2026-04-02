import 'package:flutter/material.dart';
import '../models/person.dart';
import 'follow_button.dart';

class PeopleTile extends StatelessWidget {
  final Person person;
  final VoidCallback onFollowTap;

  const PeopleTile({
    super.key,
    required this.person,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(person.imageUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  person.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  person.subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          FollowButton(
            isFollowing: person.isFollowing,
            onTap: onFollowTap,
          ),
        ],
      ),
    );
  }
}