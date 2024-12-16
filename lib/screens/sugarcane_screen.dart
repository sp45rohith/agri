import 'package:flutter/material.dart';

class SugarcaneScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const SugarcaneScreen({
    Key? key,
    this.title = 'Sugarcane Crops',
    this.imageUrl = 'assets/sugarcane.png',
    this.description = 'Climate: Warm tropical climate with temperatures between 20-32°C.\n\n'
        'Soil: Well-drained, sandy to loamy soil with a pH of 6.0-8.0.\n\n'
        'Planting Time: During the rainy season (June-July).\n\n'
        'Seed Preparation: Use healthy sugarcane setts with buds.\n\n'
        'Fertilizer: Apply 150 kg N, 80 kg P, and 120 kg K per hectare.\n\n'
        'Irrigation: Requires frequent irrigation, especially in dry areas.\n\n'
        'Common Pests/Diseases: Shoot borer, red rot.\n\n'
        'Harvest Time: 10-18 months after planting.\n\n'
        'Modern Techniques: Use mechanized harvesting for improved efficiency.',
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
                      'Sugarcane',
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
                      'Warm tropical climate with temperatures between 20-32°C.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Soil',
                  icon: Icons.grass,
                  content: 'Well-drained, sandy to loamy soil with a pH of 6.0-8.0.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Planting Time',
                  icon: Icons.calendar_today,
                  content: 'During the rainy season (June-July).',
                ),
                _buildInfoCard(
                  context,
                  title: 'Seed Preparation',
                  icon: Icons.spa,
                  content: 'Use healthy sugarcane setts with buds.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Fertilizer',
                  icon: Icons.agriculture,
                  content:
                      'Apply 150 kg N, 80 kg P, and 120 kg K per hectare.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Irrigation',
                  icon: Icons.water,
                  content: 'Requires frequent irrigation, especially in dry areas.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Common Pests/Diseases',
                  icon: Icons.bug_report,
                  content: 'Shoot borer, red rot.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Harvest Time',
                  icon: Icons.schedule,
                  content: '10-18 months after planting.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Modern Techniques',
                  icon: Icons.science,
                  content:
                      'Use mechanized harvesting for improved efficiency.',
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
