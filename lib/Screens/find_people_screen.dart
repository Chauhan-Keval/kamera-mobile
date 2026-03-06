import 'package:flutter/material.dart';
import '../components/community_card.dart';
import '../components/people_tile.dart';
import '../models/person.dart';
import '../models/community.dart';

class FindPeopleScreen extends StatefulWidget {
  const FindPeopleScreen({super.key});

  @override
  State<FindPeopleScreen> createState() => _FindPeopleScreenState();
}

class _FindPeopleScreenState extends State<FindPeopleScreen> {
  List<Person> people = [
    Person(
      name: "Alex Rivers",
      subtitle: "12 mutual friends",
      imageUrl: "https://i.pravatar.cc/150?img=1",
    ),
    Person(
      name: "Marcus Chen",
      subtitle: "Film enthusiast • LA",
      imageUrl: "https://i.pravatar.cc/150?img=2",
      isFollowing: true,
    ),
    Person(
      name: "Sarah Jenkins",
      subtitle: "Indie Movie Critic",
      imageUrl: "https://i.pravatar.cc/150?img=3",
    ),
    Person(
      name: "Oliver Wright",
      subtitle: "8 mutual friends",
      imageUrl: "https://i.pravatar.cc/150?img=4",
    ),
  ];

  final List<Community> communities = [
    Community(
      title: "Classic Cinema",
      members: "2.4k Members",
      icon: Icons.movie,
    ),
    Community(
      title: "Behind Scenes",
      members: "1.8k Members",
      icon: Icons.camera_alt,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Center(
                  child: Text(
                    "Find People",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 20),

                _searchBar(),

                const SizedBox(height: 30),

                const Text(
                  "Suggested for You",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                ListView.builder(
                  itemCount: people.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PeopleTile(
                      person: people[index],
                      onFollowTap: () {
                        setState(() {
                          people[index] = Person(
                            name: people[index].name,
                            subtitle: people[index].subtitle,
                            imageUrl: people[index].imageUrl,
                            isFollowing: !people[index].isFollowing,
                          );
                        });
                      },
                    );
                  },
                ),

                const SizedBox(height: 30),

                const Text(
                  "Discover Communities",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                Row(
                  children: communities
                      .map((c) => Padding(
                    padding:
                    const EdgeInsets.only(right: 16),
                    child: CommunityCard(
                        community: c),
                  ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Text(
            "Search for film lovers...",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}