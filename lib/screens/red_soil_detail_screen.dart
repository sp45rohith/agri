import 'package:flutter/material.dart';

class RedSoilDetailScreen extends StatefulWidget {
  const RedSoilDetailScreen({Key? key}) : super(key: key);

  @override
  _RedSoilDetailScreenState createState() => _RedSoilDetailScreenState();
}

class _RedSoilDetailScreenState extends State<RedSoilDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Red Soil Details'),
        backgroundColor: const Color(0xFF00A86B), // AppBar color remains solid
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Card with Gradient Background using Green Gradient
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade800, Colors.green.shade400], // Green gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Red Soil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image of Red Soil
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/red.png', // Ensure the path is correct
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Information Cards with Gradient Background
            _buildInfoCard(
              context,
              title: 'Climate',
              icon: Icons.thermostat,
              content: 'Red soil performs well in warm and temperate climates. Ideal temperature: 20°C - 30°C.',
            ),
            _buildInfoCard(
              context,
              title: 'Soil Type',
              icon: Icons.grass,
              content: 'Rich in iron and aluminum but low in nitrogen and humus. Known for good drainage properties.',
            ),
            _buildInfoCard(
              context,
              title: 'Planting Time',
              icon: Icons.calendar_today,
              content: 'Best planting season is early spring or after moderate rainfall. Ideal months: March - May.',
            ),
            _buildInfoCard(
              context,
              title: 'Soil Composition',
              icon: Icons.format_list_bulleted,
              content: 'Red soil contains high amounts of iron oxide, sand, and small quantities of organic matter.',
            ),
            _buildInfoCard(
              context,
              title: 'Benefits of Red Soil',
              icon: Icons.star,
              content: 'This soil supports crops in regions with less rainfall, improves plant growth, and is suitable for dry farming.',
            ),
            _buildInfoCard(
              context,
              title: 'Uses of Red Soil',
              icon: Icons.shopping_cart,
              content: 'Commonly used for crops like pulses, millets, groundnuts, and cotton. Highly valued for horticulture.',
            ),
            const SizedBox(height: 20),
            // Learn More Button
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Explore more about Red Soil!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Green to match the gradient theme
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

  // Function to build each info card
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
