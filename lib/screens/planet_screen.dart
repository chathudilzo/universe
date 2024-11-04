import 'package:flutter/material.dart';
import 'package:universe/classes/planet.dart';

class PlanetDetailPage extends StatelessWidget {
  final Planet planet;

  const PlanetDetailPage({Key? key, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
        backgroundColor: Colors.black,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPlanetImage(),
            _buildDescription(),
            _buildSection("Namesake", planet.namesake),
            _buildSection("Potential for Life", planet.potentialForLife),
            _buildInfoSection("Size and Distance", planet.sizeAndDistance),
            _buildInfoSection("Orbit and Rotation", planet.orbitAndRotation),
            _buildMoonsSection(),
            _buildSection("Rings", planet.rings),
            _buildSection("Formation", planet.formation),
            _buildInfoSection("Structure", planet.structure),
            _buildInfoSection("Surface", planet.surface),
            _buildInfoSection("Atmosphere", planet.atmosphere),
            _buildSection("Magnetosphere", planet.magnetosphere['description']),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanetImage() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(planet.imageUrl),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            planet.shortDescription,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 8),
          Text(
            planet.introduction,
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, Map<String, dynamic> info) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8),
              ...info.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "${entry.key}: ${entry.value}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoonsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Moons",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8),
              ...planet.moons.map<Widget>((moon) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "${moon['name']}: ${moon['description']}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
