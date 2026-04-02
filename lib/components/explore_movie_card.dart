import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../Screens/movie_detail_screen.dart';
import '../models/movie.dart';

=======

import '../Screens/movie_detail_screen.dart';
import '../models/movie.dart';
>>>>>>> origin/main
class ExploreMovieCard extends StatelessWidget {
  final Movie movie;

  const ExploreMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
<<<<<<< HEAD
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)));
=======
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MovieDetailScreen(movie: movie),
          ),
        );
>>>>>>> origin/main
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
<<<<<<< HEAD
=======
          // Image area
>>>>>>> origin/main
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.imageUrl,
                    width: double.infinity,
<<<<<<< HEAD
=======
                    height: double.infinity,
>>>>>>> origin/main
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: Colors.grey.shade300),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
<<<<<<< HEAD
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
=======
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
>>>>>>> origin/main
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating.toString(),
                          style: const TextStyle(
<<<<<<< HEAD
                              color: Colors.white, fontSize: 12),
=======
                            color: Colors.white,
                            fontSize: 12,
                          ),
>>>>>>> origin/main
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
<<<<<<< HEAD
          Text(
            movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "${movie.genre} • ${movie.duration}",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
=======
          // Title
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          // Genre + duration
          Text(
            "${movie.genre} • ${movie.duration}",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
>>>>>>> origin/main
          ),
        ],
      ),
    );
  }
}
