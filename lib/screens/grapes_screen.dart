import 'package:flutter/material.dart';

class GrapesScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const GrapesScreen({
    Key? key,
    this.title = 'Grapes Crops',
    this.imageUrl = 'assets/grapes.png',
    this.description = 'Climate: Warm, temperate climate with temperatures between 22-30°C.\n\n'
        'Soil: Well-drained, slightly acidic soils with pH 5.5-6.5.\n\n'
        'Planting Time: Spring or early summer.\n\n'
        'Seed Preparation: Use certified disease-free grape vines.\n\n'
        'Fertilizer: Apply 150 kg N, 75 kg P, and 100 kg K per hectare.\n\n'
        'Irrigation: Moderate; ensure consistent moisture levels during fruit formation.\n\n'
        'Common Pests/Diseases: Grapevine moth, downy mildew, powdery mildew.\n\n'
        'Harvest Time: 110-120 days after planting.\n\n'
        'Modern Techniques: Use trellising and pruning for better air circulation and fruit yield.',
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
                      'Grapes',
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
                      'Warm, temperate climate with temperatures between 22-30°C.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Soil',
                  icon: Icons.grass,
                  content: 'Well-drained, slightly acidic soils with pH 5.5-6.5.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Planting Time',
                  icon: Icons.calendar_today,
                  content: 'Spring or early summer.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Seed Preparation',
                  icon: Icons.spa,
                  content: 'Use certified disease-free grape vines.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Fertilizer',
                  icon: Icons.agriculture,
                  content:
                      'Apply 150 kg N, 75 kg P, and 100 kg K per hectare.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Irrigation',
                  icon: Icons.water,
                  content:
                      'Moderate; ensure consistent moisture levels during fruit formation.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Common Pests/Diseases',
                  icon: Icons.bug_report,
                  content:
                      'Grapevine moth, downy mildew, powdery mildew.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Harvest Time',
                  icon: Icons.schedule,
                  content: '110-120 days after planting.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Modern Techniques',
                  icon: Icons.science,
                  content:
                      'Use trellising and pruning for better air circulation and fruit yield.',
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
