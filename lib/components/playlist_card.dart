import 'package:flutter/material.dart';
import '../Screens/playlist_detail_screen.dart';
import '../models/playlist.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlist;

  final Function(String action)? onMenuTap;

  const PlaylistCard({
    super.key,
    required this.playlist,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlaylistDetailScreen(
              playlist: playlist,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: playlist.imageUrl.isEmpty
                  ? Container(
                width: 70,
                height: 90,
                color: Colors.grey.shade300,
                child: const Icon(Icons.movie),
              )
                  : Image.network(
                playlist.imageUrl,
                width: 70,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 14),

            // TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${playlist.movieCount} Movies • ${playlist.updatedTime}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            PopupMenuButton<String>(
              onSelected: (value) {
                if (onMenuTap != null) {
                  onMenuTap!(value); // ✅ CALL BACK TO SCREEN
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: "rename",
                  child: Text("Rename"),
                ),
                const PopupMenuItem(
                  value: "delete",
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}