import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../Screens/movie_detail_screen.dart';

class TrendingMovieCard extends StatelessWidget {
  final Movie movie;

  const TrendingMovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailScreen(movie: movie),
          ),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      movie.imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: _ratingBadge(),
                    ),
                  ],
                ),
              ),
            ),
            _info(),
          ],
        ),
      ),
    );
  }

  Widget _ratingBadge() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 14),
        const SizedBox(width: 4),
        Text(
          movie.rating.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    ),
  );

  Widget _info() => Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          "${movie.genre} • ${movie.duration}",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    ),
  );
}