import 'package:flutter/material.dart';

class AlluvialSoilDetailScreen extends StatefulWidget {
  const AlluvialSoilDetailScreen({Key? key}) : super(key: key);

  @override
  _AlluvialSoilDetailScreenState createState() => _AlluvialSoilDetailScreenState();
}

class _AlluvialSoilDetailScreenState extends State<AlluvialSoilDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alluvial Soil Details'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Alluvial Soil',
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
                'assets/alluvial.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoCard(
              title: 'Regions Found',
              icon: Icons.map,
              content: 'Commonly found in river basins like the Ganges, Nile, and Yangtze.',
            ),
            _buildInfoCard(
              title: 'Composition',
              icon: Icons.science,
              content: 'Rich in silt, clay, and sand. Contains potash, lime, and phosphoric acid.',
            ),
            _buildInfoCard(
              title: 'Crops Grown',
              icon: Icons.agriculture,
              content: 'Ideal for rice, wheat, sugarcane, and legumes.',
            ),
            _buildInfoCard(
              title: 'Properties',
              icon: Icons.star,
              content: 'Highly fertile soil known for its water-retaining capacity.',
            ),
            _buildLearnMoreButton(),
          ],
        ),
      ),
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
          const SnackBar(content: Text('Explore more about Alluvial Soil!')),
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
