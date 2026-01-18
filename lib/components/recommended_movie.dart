import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'recommended_movie_card.dart';

class RecommendedMovie extends StatelessWidget {
  final List<Movie> movies;

  const RecommendedMovie({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return RecommendedMovieCard(
          movie: movies[index],
        );
      },
    );
  }
}
