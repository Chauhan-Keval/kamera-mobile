import 'package:flutter/foundation.dart';

class Movie {
  final String title;
  final String genre;
  final String category;
  final String duration;
  final double rating;
  final String imageUrl;

  Movie({
    required this.title,
    required this.genre,
    required this.category,
    required this.duration,
    required this.rating,
    required this.imageUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      genre: json['genre'],
      category: json['category'],
      duration: json['duration'],
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] ?? "",
    );
  }
}



