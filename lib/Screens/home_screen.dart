  import 'package:flutter/material.dart';
  import 'package:kamera/Screens/profile_screen.dart';
  import 'package:kamera/components/recommended_movie.dart';
  import 'package:kamera/components/trending_movie.dart';
  import 'package:kamera/services/movie_service.dart';
  import '../models/movie.dart';
  import 'bookmark_screen.dart';
  import 'discover_people_screen.dart';
  import 'explore_screen.dart';

  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {



    int selectedCategoryIndex = 0;

    final List<String> categories = [
      "All Movies",
      "Action",
      "Comedy",
    ];

    String searchQuery = "";


    List<Movie> filterByCategory(List<Movie> movies) {
      if (selectedCategoryIndex == 0) {
        return movies; // All Movies
      } else if (selectedCategoryIndex == 1) {
        return movies.where((m) => m.genre == "Action").toList();
      } else if (selectedCategoryIndex == 2) {
        return movies.where((m) => m.genre == "Comedy").toList();
      }
      return movies;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xFFF2FAFF),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "WELCOME BACK 👋",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "KAMERA",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1677FF),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.orangeAccent,
                      child: const Text("USR"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Search Bar
                Container(
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

                      //  SEARCH INPUT
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

                ),

                const SizedBox(height: 20),

                // Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categories.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: categoryChip(
                            categories[index],
                            selectedCategoryIndex == index,
                          ),
                        ),
                      );
                    }),
                  ),
                ),


                const SizedBox(height: 30),

                // Trending Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Trending Now 🔥",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFF1677FF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                FutureBuilder<List<Movie>>(
                  future: MovieService.fetchMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Center(child: Text("Failed to load movies"));
                    }

                    final movies = snapshot.data!;


                    // CATEGORY
                    final categoryFiltered = filterByCategory(movies);

                    // SECTION FILTER
                    final trendingMovies = categoryFiltered
                        .where((m) => m.category == "Trending")
                        .toList();

                    final recommendedMovies = categoryFiltered
                        .where((m) => m.category == "Recommended")
                        .toList();

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Trending
                        TrendingMovie(movies: trendingMovies),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Recommended",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Recommended
                        RecommendedMovie(movies: recommendedMovies),
                      ],
                    );
                  },
                ),

              ],
            ),
          ),
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
          ] : [],
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




  }


