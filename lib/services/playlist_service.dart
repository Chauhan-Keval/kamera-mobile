import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/playlist.dart';

class PlaylistService {
  static const String baseUrl =
      "https://696b277b624d7ddccaa06250.mockapi.io/api/v1";

  /// CREATE PLAYLIST
  static Future<Playlist?> createPlaylist({
    required String title,
    required bool isPrivate,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/playlists"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "movieCount": 0,
        "updatedTime": "Now",
        "isPrivate": isPrivate,
        "imageUrl": "",
        "movies": [],
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);

      return Playlist.fromJson(data); // ✅ CLEAN
    } else {
      return null;
    }
  }

  /// GET PLAYLISTS
  static Future<List<Playlist>> fetchPlaylists() async {
    final response = await http.get(
      Uri.parse("$baseUrl/playlists"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((e) => Playlist.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load playlists");
    }
  }

  /// DELETE PLAYLIST
  static Future<bool> deletePlaylist(String id) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/playlists/$id"),
    );

    print("DELETE STATUS: ${response.statusCode}");

    return response.statusCode == 200;
  }

  /// UPDATE PLAYLIST NAME
  static Future<bool> updatePlaylist({
    required String id,
    required String title,
  }) async {
    final response = await http.put(
      Uri.parse("$baseUrl/playlists/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
      }),
    );

    print("UPDATE STATUS: ${response.statusCode}");

    return response.statusCode == 200;
  }

  /// ADD MOVIE TO PLAYLIST
  static Future<bool> addMovieToPlaylist({
    required Playlist playlist,
    required dynamic movie,
  }) async {
    // ✅ COPY list (important)
    final List<Map<String, dynamic>> updatedMovies = playlist.movies.map((m) => m.toJson()).toList();

    // Since movie could be a Map or Movie, handle both for safety during transition
    if (movie is Map) {
      updatedMovies.add(movie as Map<String, dynamic>);
    } else {
      updatedMovies.add(movie.toJson());
    }

    final response = await http.put(
      Uri.parse("$baseUrl/playlists/${playlist.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "movies": updatedMovies,
        "movieCount": updatedMovies.length,
        "updatedTime": "Now",
      }),
    );

    print("ADD MOVIE STATUS: ${response.statusCode}");

    return response.statusCode == 200;
  }

  /// REMOVE MOVIE FROM PLAYLIST
  static Future<bool> removeMovieFromPlaylist({
    required Playlist playlist,
    required String movieId,
  }) async {
    final updatedMovies = playlist.movies
        .where((m) => m.id != movieId)
        .map((m) => m.toJson())
        .toList();

    final response = await http.put(
      Uri.parse("$baseUrl/playlists/${playlist.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "movies": updatedMovies,
        "movieCount": updatedMovies.length,
        "updatedTime": "Now",
      }),
    );

    print("REMOVE MOVIE STATUS: ${response.statusCode}");

    return response.statusCode == 200;
  }
}