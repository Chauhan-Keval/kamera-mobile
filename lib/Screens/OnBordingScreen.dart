import 'package:flutter/material.dart';

class Onbordingscreen extends StatefulWidget {
  const Onbordingscreen({super.key});

  @override
  State<Onbordingscreen> createState() => _OnbordingscreenState();
}

class _OnbordingscreenState extends State<Onbordingscreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "icon": Icons.movie_filter,
      "title": "Create Playlists",
      "desc":
      "Save your favorite movies in private or public playlists and manage them easily.",
    },
    {
      "icon": Icons.share,
      "title": "Share with Friends",
      "desc":
      "Share your public playlists with friends and suggest movies effortlessly.",
    },
    {
      "icon": Icons.auto_awesome,
      "title": "Discover Movies",
      "desc":
      "Explore thousands of movies. Find the latest blockbusters and hidden gems tailored just for you.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF4FF), Color(0xFFD6E9FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),

            // 🔄 PAGEVIEW (Swipe works here)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 🔵 Circle + icon
                      ClipOval(
                        child: Container(
                          height: 250,
                          width: 250,
                          color: Colors.blueAccent.shade100,
                          child: Center(
                            child: Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                pages[index]["icon"],
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // 📝 Text section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Text(
                              pages[index]["title"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              pages[index]["desc"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // 🔘 Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => Container(
                  margin: const EdgeInsets.all(4),
                  height: 8,
                  width: currentPage == index ? 16 : 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Colors.blue
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ⏭ Bottom buttons
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip
                  TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(pages.length - 1);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  // Next / Start
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                    ),
                    onPressed: () {
                      if (currentPage < pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // TODO: Navigate to Home screen
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          currentPage == pages.length - 1
                              ? "Start"
                              : "Next",
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
