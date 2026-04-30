import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MovieService {
  static const String _baseUrl =
      "https://696b277b624d7ddccaa06250.mockapi.io/api/v1";

  static Future<List<Movie>> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 1));

    final response = await http.get(Uri.parse("$_baseUrl/Movies"));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Movie.fromJson(e)).toList();
    } else {
      // Try to parse a response body even on non-200 replies, otherwise throw
      try {
        final List data = jsonDecode(response.body);
        return data.map((e) => Movie.fromJson(e)).toList();
      } catch (_) {
        throw Exception(
            "Failed to load movies (status: ${response.statusCode})");
      }
    }
  }
}
