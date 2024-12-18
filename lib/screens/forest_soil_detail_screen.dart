import 'package:flutter/material.dart';

class ForestSoilDetailScreen extends StatefulWidget {
  const ForestSoilDetailScreen({Key? key}) : super(key: key);

  @override
  _ForestSoilDetailScreenState createState() => _ForestSoilDetailScreenState();
}

class _ForestSoilDetailScreenState extends State<ForestSoilDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forest Soil Details'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleCard('Forest Soil', 'assets/forest.png'),
            const SizedBox(height: 20),
            _buildInfoCard(
              title: 'Regions Found',
              icon: Icons.map,
              content: 'Found in forest regions with heavy rainfall and high organic matter.',
            ),
            _buildInfoCard(
              title: 'Composition',
              icon: Icons.science,
              content: 'Rich in organic matter and humus but low in phosphorus.',
            ),
            _buildInfoCard(
              title: 'Uses',
              icon: Icons.nature,
              content: 'Supports evergreen vegetation and crops like tea, coffee, and spices.',
            ),
            _buildLearnMoreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleCard(String title, String imagePath) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({required String title, required IconData icon, required String content}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(content, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearnMoreButton() {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Explore more about Forest Soil!')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: const Icon(Icons.explore),
      label: const Text('Learn More', style: TextStyle(fontSize: 18)),
    );
  }
}
