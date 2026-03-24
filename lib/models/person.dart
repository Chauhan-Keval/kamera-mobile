class Person {
  final String name;
  final String subtitle;
  final String imageUrl;
  final bool isFollowing;

  Person({
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    this.isFollowing = false,
  });
}