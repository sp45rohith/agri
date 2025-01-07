import 'package:flutter/material.dart';

class WheatScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const WheatScreen({
    Key? key,
    this.title = 'Wheat Crops',
    this.imageUrl = 'assets/wheat.png',
    this.description = 'Climate: Cool, dry weather with optimal temperature 20-25°C.\n\n'
        'Soil: Loamy or clay loam with pH 6.5–7.5.\n\n'
        'Planting Time: Rabi season (Oct-Nov).\n\n'
        'Seed Rate: 100-120 kg/ha. Ensure proper seed treatment to prevent soil-borne diseases.\n\n'
        'Fertilizer: Apply 120 kg N, 60 kg P, and 40 kg K per hectare.\n\n'
        'Irrigation: Critical at the crown root initiation, heading, and flowering stages.\n\n'
        'Common Pests/Diseases: Wheat stem sawfly, aphids. Diseases: Rust, smut.\n\n'
        'Harvest Time: 120-150 days after sowing.\n\n'
        'Modern Techniques: Laser land leveling for even water distribution; adopt zero tillage for resource conservation.',
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
                      'Wheat',
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
                  content: 'Cool, dry weather with temperatures ranging from 20-25°C.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Soil',
                  icon: Icons.grass,
                  content: 'Loamy or clay loam with pH 6.5–7.5.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Planting Time',
                  icon: Icons.calendar_today,
                  content: 'Rabi season (Oct-Nov).',
                ),
                _buildInfoCard(
                  context,
                  title: 'Seed Rate',
                  icon: Icons.spa,
                  content: '100-120 kg/ha. Ensure proper seed treatment to prevent soil-borne diseases.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Fertilizer',
                  icon: Icons.agriculture,
                  content: 'Apply 120 kg N, 60 kg P, and 40 kg K per hectare.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Irrigation',
                  icon: Icons.water,
                  content: 'Critical at the crown root initiation, heading, and flowering stages.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Common Pests/Diseases',
                  icon: Icons.bug_report,
                  content: 'Pests: Wheat stem sawfly, aphids. Diseases: Rust, smut.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Harvest Time',
                  icon: Icons.schedule,
                  content: '120-150 days after sowing.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Modern Techniques',
                  icon: Icons.science,
                  content: 'Laser land leveling for even water distribution; adopt zero tillage for resource conservation.',
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
