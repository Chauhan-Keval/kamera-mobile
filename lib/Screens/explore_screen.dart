import 'package:flutter/material.dart';
import '../components/explore_movie_grid.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int selectedGenreIndex = 0;
  String searchQuery = "";

  final List<String> genres = ["All", "Sci-Fi", "Drama", "Horror"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Explore",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1677FF),
                ),
              ),

              const SizedBox(height: 20),

              searchBar(),

              const SizedBox(height: 20),

              genreChips(),

              const SizedBox(height: 30),

              popularHeader(),

              const SizedBox(height: 16),

              // MOVIE GRID
              Expanded(
                child: FutureBuilder<List<Movie>>(
                  future: MovieService.fetchMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    List<Movie> movies = snapshot.data ?? [];

                    // SEARCH FILTER
                    if (searchQuery.isNotEmpty) {
                      movies = movies
                          .where((m) => m.title
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()))
                          .toList();
                    }

                    // GENRE FILTER
                    if (selectedGenreIndex != 0) {
                      final selectedGenre = genres[selectedGenreIndex];
                      movies = movies
                          .where((m) =>
                      m.genre.toLowerCase() ==
                          selectedGenre.toLowerCase())
                          .toList();
                    }

                    // EMPTY STATE
                    if (movies.isEmpty) {
                      return const Center(
                        child: Text(
                          "No movies found",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }

                    return ExploreMovieGrid(movies: movies);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  Search Bar
  Widget searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search movies, series...",
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Genre Chips
  Widget genreChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(genres.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGenreIndex = index;
                });
              },
              child: categoryChip(
                genres[index],
                selectedGenreIndex == index,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget categoryChip(String text, bool selected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF1677FF) : Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: selected
            ? [
          BoxShadow(
            color: const Color(0xFF1677FF).withOpacity(0.3),
            blurRadius: 8,
          )
        ]
            : [],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black54,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  //  Popular Header
  Widget popularHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Popular Search",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "Refresh",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}