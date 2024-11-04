class Planet {
  final String name;
  final String imageUrl;
  final String shortDescription;
  final String introduction;
  final String namesake;
  final String potentialForLife;
  final Map<String, dynamic> sizeAndDistance;
  final String modelUrl;
  final Map<String, dynamic> orbitAndRotation;
  final List<dynamic> moons;
  final String rings;
  final String formation;
  final Map<String, dynamic> structure;
  final Map<String, dynamic> surface;
  final Map<String, dynamic> atmosphere;
  final Map<String, dynamic> magnetosphere;

  Planet({
    required this.name,
    required this.imageUrl,
    required this.shortDescription,
    required this.introduction,
    required this.namesake,
    required this.potentialForLife,
    required this.sizeAndDistance,
    required this.modelUrl,
    required this.orbitAndRotation,
    required this.moons,
    required this.rings,
    required this.formation,
    required this.structure,
    required this.surface,
    required this.atmosphere,
    required this.magnetosphere,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    print(json);
    return Planet(
      name: json['name'],
      imageUrl: json['image_url'],
      shortDescription: json['short_description'],
      introduction: json['introduction'],
      namesake: json['namesake'],
      potentialForLife: json['potential_for_life'],
      sizeAndDistance: json['size_and_distance'],
      modelUrl: json['model_url'],
      orbitAndRotation: json['orbit_and_rotation'],
      moons: json['moons'],
      rings: json['rings'],
      formation: json['formation'],
      structure: json['structure'],
      surface: json['surface'],
      atmosphere: json['atmosphere'],
      magnetosphere: json['magnetosphere'],
    );
  }
}
