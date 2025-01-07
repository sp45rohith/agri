import 'package:flutter/material.dart';

class TomatoScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const TomatoScreen({
    Key? key,
    this.title = 'Tomato Crops',
    this.imageUrl = 'assets/tomato.png',
    this.description = 'Climate: Warm, sunny climates; 20-25°C for growth.\n\n'
        'Soil: Well-drained sandy loam with pH 6–7.\n\n'
        'Planting Time: Varied – Summer, Rabi, and Kharif seasons.\n\n'
        'Seedling Preparation: Raise seedlings in nurseries and transplant after 25-30 days.\n\n'
        'Fertilizer: Apply 100 kg N, 50 kg P, and 50 kg K per hectare.\n\n'
        'Irrigation: Moderate; avoid waterlogging.\n\n'
        'Common Pests/Diseases: Fruit borer, whiteflies. Diseases: Early blight, bacterial wilt, mosaic virus.\n\n'
        'Harvest Time: 60-80 days after transplanting.\n\n'
        'Modern Techniques: Use greenhouses or shade nets for pest protection; adopt drip irrigation with fertigation.',
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
                      'Tomato',
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
                  content: 'Warm, sunny climates; 20-25°C for growth.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Soil',
                  icon: Icons.grass,
                  content: 'Well-drained sandy loam with pH 6–7.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Planting Time',
                  icon: Icons.calendar_today,
                  content: 'Varied – Summer, Rabi, and Kharif seasons.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Seedling Preparation',
                  icon: Icons.spa,
                  content: 'Raise seedlings in nurseries and transplant after 25-30 days.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Fertilizer',
                  icon: Icons.agriculture,
                  content: 'Apply 100 kg N, 50 kg P, and 50 kg K per hectare.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Irrigation',
                  icon: Icons.water,
                  content: 'Moderate; avoid waterlogging.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Common Pests/Diseases',
                  icon: Icons.bug_report,
                  content: 'Fruit borer, whiteflies. Diseases: Early blight, bacterial wilt, mosaic virus.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Harvest Time',
                  icon: Icons.schedule,
                  content: '60-80 days after transplanting.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Modern Techniques',
                  icon: Icons.science,
                  content: 'Use greenhouses or shade nets for pest protection; adopt drip irrigation with fertigation.',
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
