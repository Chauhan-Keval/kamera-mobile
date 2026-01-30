class Cast {
  final String name;
  final String image;

  Cast({
    required this.name,
    required this.image,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'] ?? "Unknown",
      image: json['image'] ?? "",
    );
  }
}