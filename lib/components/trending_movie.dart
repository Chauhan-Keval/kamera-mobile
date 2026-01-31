import 'package:flutter/material.dart';
import 'package:kamera/components/trending_movie_card.dart';

import '../models/movie.dart';
class TrendingMovie extends StatelessWidget {
  final List<Movie> movies;

  const TrendingMovie({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return TrendingMovieCard(movie: movie);
        },
      ),
    );
  }
}

