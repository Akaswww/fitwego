class Gym {
  const Gym({
    required this.name,
    required this.address,
    required this.distanceKm,
    required this.rating,
    required this.openHours,
    required this.tags,
    required this.description,
    required this.latitudeFactor,
    required this.longitudeFactor,
  });

  final String name;
  final String address;
  final double distanceKm;
  final double rating;
  final String openHours;
  final List<String> tags;
  final String description;
  final double latitudeFactor;
  final double longitudeFactor;
}
