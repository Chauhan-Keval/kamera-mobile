import 'package:flutter/material.dart';
import '../components/cast_section.dart';
import '../models/movie.dart';
import '../models/playlist.dart';
import '../services/playlist_service.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HERO IMAGE
            Stack(
              children: [
                // IMAGE
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  child: Image.network(
                    movie.imageUrl,
                    height: 390,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const SizedBox(
                      height: 390,
                      width: double.infinity,
                      child: Center(child: Icon(Icons.broken_image, size: 80, color: Colors.grey)),
                    ),
                  ),
                ),
                // DARK GRADIENT AT BOTTOM
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                  ),
                ),

                // MOVIE TITLE ,YEAR
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${movie.year} • ${movie.duration}",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                // BACK BUTTON
                Positioned(
                  top: 50,
                  left: 20,
                  child: circleIcon(Icons.arrow_back, () {
                    Navigator.pop(context);
                  }),
                ),

                // WISHLIST BUTTON
                Positioned(
                  top: 50,
                  right: 20,
<<<<<<< HEAD
                  child: circleIcon(Icons.favorite_border, () {}),
=======
                  child: circleIcon(Icons.favorite_border, () {
                    // TOGGLE WISHLIST

                  }),
>>>>>>> origin/main
                ),
              ],
            ),
            // CONTENT
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // IMDB TITLE
                        const Text(
                          "IMDB Rating",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),

                        const SizedBox(height: 8),

                        // RATING ROW
                        ratingRow(movie),

                        const SizedBox(height: 20),
                        // GENRES
                        genreChips(movie.genre),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Storyline",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),
                        Text(
                          movie.storyline,
                          style: const TextStyle(
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CastSection(cast: movie.cast),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  bottomButtons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- UI HELPERS ---

  Widget circleIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.4),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget ratingRow(Movie movie) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 6),
        Text(
          "${movie.rating} / 10",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Spacer(),
        const Icon(Icons.trending_up, color: Colors.blue),
        const SizedBox(width: 6),
        const Text("#12"),
      ],
    );
  }

  Widget genreChips(String genre) {
    return Row(
      children: genre
          .split(',')
          .map(
            (g) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text(g),
                backgroundColor: const Color(0xFFEAF4FF),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget bottomButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              _showPlaylistPicker(context);
            },
            icon: const Icon(Icons.playlist_add, color: Colors.white),
            label: const Text(
              "Add to Playlist",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color(0xFF1677FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 26,
          backgroundColor: Color(0xFFEAF4FF),
          child: Icon(Icons.ios_share, color: Colors.black),
        ),
      ],
    );
  }

  void _showPlaylistPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Select Playlist", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Expanded(
                child: FutureBuilder<List<Playlist>>(
                  future: PlaylistService.fetchPlaylists(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(child: Text("Error fetching playlists"));
                    }
                    final playlists = snapshot.data ?? [];
                    if (playlists.isEmpty) {
                      return const Center(child: Text("No playlists available."));
                    }
                    return ListView.builder(
                      itemCount: playlists.length,
                      itemBuilder: (context, index) {
                        final playlist = playlists[index];
                        return ListTile(
                          leading: const Icon(Icons.playlist_play),
                          title: Text(playlist.title),
                          subtitle: Text("${playlist.movieCount} movies"),
                          onTap: () async {
                            Navigator.pop(context); // Close the modal early for UX

                            final success = await PlaylistService.addMovieToPlaylist(
                              playlist: playlist,
                              movie: movie,
                            );

                            if (success && context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Added to ${playlist.title}")),
                              );
                            } else if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Failed to add movie")),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
