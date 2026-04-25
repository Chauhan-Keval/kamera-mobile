import 'movie.dart';

class Playlist {
  final String id;
  final String title;
  final int movieCount;
  final String updatedTime;
  final bool isPrivate;
  final String imageUrl;
  final List<Movie> movies;

  Playlist({
    required this.id,
    required this.title,
    required this.movieCount,
    required this.updatedTime,
    required this.isPrivate,
    required this.imageUrl,
    required this.movies,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id']?.toString() ?? "",
      title: json['title'] ?? "",
      movieCount: int.tryParse(json['movieCount']?.toString() ?? '0') ?? 0,
      updatedTime: json['updatedTime'] ?? "",
      isPrivate:
      json['isPrivate'] == true || json['isPrivate'] == "true",
      imageUrl: json['imageUrl'] ?? "",

      // ✅ FIXED HERE
      movies: (json['movies'] is List)
          ? (json['movies'] as List)
          .map((e) => Movie.fromJson(e))
          .toList()
          : [],
    );
  }
}