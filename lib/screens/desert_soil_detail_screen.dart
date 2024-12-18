import 'package:flutter/material.dart';

class DesertSoilDetailScreen extends StatefulWidget {
  const DesertSoilDetailScreen({Key? key}) : super(key: key);

  @override
  _DesertSoilDetailScreenState createState() => _DesertSoilDetailScreenState();
}

class _DesertSoilDetailScreenState extends State<DesertSoilDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desert Soil Details'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleCard('Desert Soil', 'assets/desert.png'),
            const SizedBox(height: 20),
            _buildInfoCard(
              title: 'Regions Found',
              icon: Icons.map,
              content: 'Found in arid and semi-arid regions with scanty rainfall.',
            ),
            _buildInfoCard(
              title: 'Composition',
              icon: Icons.science,
              content: 'High sand content, low organic matter, and alkaline in nature.',
            ),
            _buildInfoCard(
              title: 'Uses',
              icon: Icons.agriculture,
              content: 'Supports drought-resistant plants like cactus and date palms.',
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
            color: Colors.orange,
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
            Icon(icon, color: Colors.orange, size: 28),
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
          const SnackBar(content: Text('Explore more about Desert Soil!')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: const Icon(Icons.explore),
      label: const Text('Learn More', style: TextStyle(fontSize: 18)),
    );
  }
}
