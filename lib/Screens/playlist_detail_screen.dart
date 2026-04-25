import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../models/movie.dart';
import 'add_movie_screen.dart';
import 'movie_detail_screen.dart';
import '../services/playlist_service.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistDetailScreen({super.key, required this.playlist});

  @override
  State<PlaylistDetailScreen> createState() =>
      _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {

  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    movies = List.from(widget.playlist.movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FAFF),

      appBar: AppBar(
        title: Text(widget.playlist.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {

              final selectedMovie =
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddMovieScreen(),
                ),
              );

              if (selectedMovie != null) {
                final success = await PlaylistService.addMovieToPlaylist(
                  playlist: widget.playlist,
                  movie: selectedMovie,
                );

                if (success) {
                  setState(() {
                    movies.add(selectedMovie);
                  });
                }
              }
            },
          )
        ],
      ),

      body: movies.isEmpty
          ? const Center(child: Text("No movies yet"))
          : ListView.builder(
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
            subtitle: Text(movie.genre),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}