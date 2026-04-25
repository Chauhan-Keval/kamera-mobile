import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class AddMovieScreen extends StatelessWidget {
  const AddMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Movie")),
      body: FutureBuilder<List<Movie>>(
        future: MovieService.fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final movies = snapshot.data ?? [];

          if (movies.isEmpty) {
            return const Center(child: Text("No movies available"));
          }

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: movie.imageUrl.isEmpty ? 
                    const Icon(Icons.movie, size: 50) : 
                    Image.network(
                      movie.imageUrl, 
                      width: 50, 
                      height: 70, 
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const SizedBox(
                        width: 50, 
                        height: 70, 
                        child: Icon(Icons.movie, size: 50),
                      ),
                    ),
                ),
                title: Text(movie.title),
                subtitle: Text("${movie.genre} • ${movie.year}"),
                onTap: () {
                  Navigator.pop(context, movie);
                },
              );
            },
          );
        },
      ),
    );
  }
}