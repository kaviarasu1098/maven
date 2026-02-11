class Listing {
  const Listing({
    required this.id,
    required this.title,
    required this.category,
    required this.hourlyPrice,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.verified,
  });

  final String id;
  final String title;
  final String category;
  final double hourlyPrice;
  final double latitude;
  final double longitude;
  final double rating;
  final bool verified;
}
