import 'package:flutter/material.dart';

class TundraSoilDetailScreen extends StatefulWidget {
  const TundraSoilDetailScreen({Key? key}) : super(key: key);

  @override
  _TundraSoilDetailScreenState createState() =>
      _TundraSoilDetailScreenState();
}

class _TundraSoilDetailScreenState extends State<TundraSoilDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tundra Soil Details'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Tundra Soil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image of Tundra Soil
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/tundra.png', // Make sure to use the correct path for your image
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Information Cards
            _buildInfoCard(
              context,
              title: 'Climate',
              icon: Icons.thermostat,
              content: 'Cold climates with permafrost, minimal sunlight.',
            ),
            _buildInfoCard(
              context,
              title: 'Soil Type',
              icon: Icons.grass,
              content: 'Nutrient-poor, acidic, and frozen most of the year.',
            ),
            _buildInfoCard(
              context,
              title: 'Planting Time',
              icon: Icons.calendar_today,
              content:
                  'Short growing season, plants must adapt to extreme conditions.',
            ),
            _buildInfoCard(
              context,
              title: 'Soil Composition',
              icon: Icons.format_list_bulleted,
              content:
                  'Contains moss, lichen, and sparse vegetation due to freezing conditions.',
            ),
            _buildInfoCard(
              context,
              title: 'Benefits of Tundra Soil',
              icon: Icons.star,
              content: 'Suitable for limited plant growth but resilient in harsh climates.',
            ),
            _buildInfoCard(
              context,
              title: 'Uses of Tundra Soil',
              icon: Icons.shopping_cart,
              content: 'Limited agricultural use, important for natural vegetation.',
            ),
            const SizedBox(height: 20),
            // Learn More Button
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Explore more about Tundra Soil!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.explore),
              label: const Text(
                'Learn More',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required String title, required IconData icon, required String content}) {
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
            Icon(icon, color: Colors.blueGrey, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
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
