import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'explore_movie_card.dart';

class ExploreMovieGrid extends StatelessWidget {
  final List<Movie> movies;

  const ExploreMovieGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        return ExploreMovieCard(movie: movies[index]);
      },
    );
  }
}
