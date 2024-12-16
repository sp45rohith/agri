import 'package:flutter/material.dart';

class PaddyScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const PaddyScreen({
    Key? key,
    this.title = 'Paddy Crops',
    this.imageUrl = 'assets/paddy.png',
    this.description = 'Climate: Warm and humid climate with temperatures of 25-35°C.\n\n'
        'Soil: Flooded rice fields with neutral to slightly acidic soils (pH 5.5-7).\n\n'
        'Planting Time: During the monsoon season (June-July).\n\n'
        'Seed Preparation: Use certified paddy seeds.\n\n'
        'Fertilizer: Apply 100 kg N, 40 kg P, and 60 kg K per hectare.\n\n'
        'Irrigation: High water requirement; field should be flooded during growth.\n\n'
        'Common Pests/Diseases: Rice weevil, brown plant hopper.\n\n'
        'Harvest Time: 4-5 months after planting.\n\n'
        'Modern Techniques: Use hybrid varieties for higher yield and pest resistance.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Paddy',
                      style: TextStyle(
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
                    imageUrl,
                    width: 200,
                    height: 153,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfoCard(
                  context,
                  title: 'Climate',
                  icon: Icons.thermostat,
                  content:
                      'Warm and humid climate with temperatures of 25-35°C.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Soil',
                  icon: Icons.grass,
                  content: 'Flooded rice fields with pH 5.5-7.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Planting Time',
                  icon: Icons.calendar_today,
                  content: 'During the monsoon season (June-July).',
                ),
                _buildInfoCard(
                  context,
                  title: 'Seed Preparation',
                  icon: Icons.spa,
                  content: 'Use certified paddy seeds.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Fertilizer',
                  icon: Icons.agriculture,
                  content:
                      'Apply 100 kg N, 40 kg P, and 60 kg K per hectare.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Irrigation',
                  icon: Icons.water,
                  content:
                      'High water requirement; field should be flooded during growth.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Common Pests/Diseases',
                  icon: Icons.bug_report,
                  content:
                      'Rice weevil, brown plant hopper.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Harvest Time',
                  icon: Icons.schedule,
                  content: '4-5 months after planting.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Modern Techniques',
                  icon: Icons.science,
                  content:
                      'Use hybrid varieties for higher yield and pest resistance.',
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Explore more techniques!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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
            Icon(icon, color: Colors.green, size: 28),
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
