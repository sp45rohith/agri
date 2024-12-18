import 'package:flutter/material.dart';

class SalineAlkaliSoilDetailScreen extends StatefulWidget {
  const SalineAlkaliSoilDetailScreen({Key? key}) : super(key: key);

  @override
  _SalineAlkaliSoilDetailScreenState createState() =>
      _SalineAlkaliSoilDetailScreenState();
}

class _SalineAlkaliSoilDetailScreenState
    extends State<SalineAlkaliSoilDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saline-Alkali Soil Details'),
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
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Saline-Alkali Soil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image of Saline-Alkali Soil
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/salinealkaline.png', // Make sure to use the correct path for your image
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
              content:
                  'Saline-Alkali soil thrives in hot and arid climates with less rainfall.',
            ),
            _buildInfoCard(
              context,
              title: 'Soil Type',
              icon: Icons.grass,
              content:
                  'Characterized by high salt content, reducing soil fertility for most plants.',
            ),
            _buildInfoCard(
              context,
              title: 'Planting Time',
              icon: Icons.calendar_today,
              content:
                  'Best planted during the rainy season, after leaching the soil to remove excess salt.',
            ),
            _buildInfoCard(
              context,
              title: 'Soil Composition',
              icon: Icons.format_list_bulleted,
              content:
                  'High sodium chloride content, poor drainage, and a high pH level.',
            ),
            _buildInfoCard(
              context,
              title: 'Benefits of Saline-Alkali Soil',
              icon: Icons.star,
              content:
                  'Suitable for salt-tolerant crops like barley and cotton with proper soil treatment.',
            ),
            _buildInfoCard(
              context,
              title: 'Uses of Saline-Alkali Soil',
              icon: Icons.shopping_cart,
              content:
                  'Used for cultivation of salt-tolerant crops and can be treated for better soil health.',
            ),
            const SizedBox(height: 20),
            // Learn More Button
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Explore more about Saline-Alkali Soil!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
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
            Icon(icon, color: Colors.blue, size: 28),
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
