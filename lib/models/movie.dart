import 'cast.dart';

class Movie {
  final String title;
  final String genre;
  final String year;
  final String category;
  final String duration;
  final double rating;
  final String imageUrl;
  final List<Cast> cast;
  final String storyline;



  Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.category,
    required this.duration,
    required this.rating,
    required this.imageUrl,
    required this.cast,
    required this.storyline,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      genre: json['genre'],
      year: json['year'],
      category: json['category'],
      duration: json['duration'],
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] ?? "",
      cast: (json['cast'] as List)
          .map((e) => Cast.fromJson(e))
          .toList(),
      storyline: json['storyline'] ?? "No storyline available.",
    );
  }
}
