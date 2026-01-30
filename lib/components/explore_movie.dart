import 'package:flutter/material.dart';
import 'package:kamera/components/explore_movie_card.dart';

import '../models/movie.dart';
class ExploreMovie extends StatelessWidget {
  const ExploreMovie({super.key, required this.movies});

  final List<Movie> movies;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        // return ExploreMovieCard(
        //   // movie: movies[index],
        // );
      },
    );
  }
}
