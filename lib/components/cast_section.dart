import 'package:flutter/material.dart';
import '../models/cast.dart';

class CastSection extends StatelessWidget {
  final List<Cast> cast;

  const CastSection({
    super.key,
    required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    if (cast.isEmpty) {
      return const Text(
        "No cast information available",
        style: TextStyle(color: Colors.grey),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Cast",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "See all",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (context, index) {
              final actor = cast[index];

              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(actor.image),
                      backgroundColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      actor.name,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}