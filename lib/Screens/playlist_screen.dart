import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../components/playlist_card.dart';
import '../components/playlist_toggle.dart';
import '../components/create_playlist_sheet.dart';
import '../services/playlist_service.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  Future<List<Playlist>>? futurePlaylists;

  @override
  void initState() {
    super.initState();
    futurePlaylists = PlaylistService.fetchPlaylists();
  }

  int selectedTab = 0;
  void openCreatePopup() {
    showModalBottomSheet(
      context: context,
      builder: (_) => CreatePlaylistSheet(
        onCreate: (name, isPrivate) async {

          final newPlaylist =
          await PlaylistService.createPlaylist(
            title: name,
            isPrivate: isPrivate,
          );

          if (newPlaylist != null) {
            setState(() {
              //  reload from API
              futurePlaylists =
                  PlaylistService.fetchPlaylists();
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF2FAFF),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("My Playlists",
                    style: TextStyle(fontSize: 24)),
                IconButton(
                  icon: const Icon(Icons.add),
                    onPressed: openCreatePopup,

                )
              ],
            ),

            const SizedBox(height: 20),

            // TOGGLE
            PlaylistToggle(
              selectedIndex: selectedTab,
              onTap: (i) {
                setState(() {
                  selectedTab = i;
                });
              },
            ),

            const SizedBox(height: 20),

            // LIST
            Expanded(
              child: FutureBuilder<List<Playlist>>(
                future: futurePlaylists,
                builder: (context, snapshot) {

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text("Error loading playlists"));
                  }

                  final playlists = snapshot.data!;

                  // ✅ADD FILTER HERE
                  final filtered = playlists.where((p) {
                    if (selectedTab == 0) {
                      return p.isPrivate == true;
                    } else {
                      return p.isPrivate == false;
                    }
                  }).toList();

                  if (filtered.isEmpty) {
                    return const Center(child: Text("No playlists"));
                  }

                  return  RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        futurePlaylists =
                            PlaylistService.fetchPlaylists();
                      });
                    },
                    child: ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        return PlaylistCard(
                          playlist: filtered[index],
                          onMenuTap: (action) async {
                            final playlist = filtered[index];
                            if (action == "rename") {
                              final controller = TextEditingController(text: playlist.title);
                              final newName = await showDialog<String>(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text("Rename Playlist"),
                                  content: TextField(
                                    controller: controller,
                                    decoration: const InputDecoration(hintText: "Enter new name"),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, controller.text),
                                      child: const Text("Save"),
                                    ),
                                  ],
                                ),
                              );

                              if (newName != null && newName.isNotEmpty) {
                                final success = await PlaylistService.updatePlaylist(
                                  id: playlist.id,
                                  title: newName,
                                );
                                if (success) {
                                  setState(() {
                                    futurePlaylists = PlaylistService.fetchPlaylists();
                                  });
                                }
                              }
                            } else if (action == "delete") {
                              final success = await PlaylistService.deletePlaylist(playlist.id);
                              if (success) {
                                setState(() {
                                  futurePlaylists = PlaylistService.fetchPlaylists();
                                });
                              }
                            }
                          },
                        );
                      },
                    ),
                  );
                },
              )
            )
          ],
        ),
      ),
    );

  }

}
