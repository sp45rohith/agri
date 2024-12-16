import 'package:flutter/material.dart';

class BlackSoilDetailScreen extends StatefulWidget {
  const BlackSoilDetailScreen({Key? key}) : super(key: key);

  @override
  _BlackSoilDetailScreenState createState() => _BlackSoilDetailScreenState();
}

class _BlackSoilDetailScreenState extends State<BlackSoilDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Black Soil Details'),
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
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Black Soil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image of Black Soil
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/black.png', // Make sure to use the correct path for your image
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
              content: 'Black soil thrives in dry and hot climates. Ideal temperature: 25°C - 40°C.',
            ),
            _buildInfoCard(
              context,
              title: 'Soil Type',
              icon: Icons.grass,
              content: 'Rich in calcium, iron, magnesium, and potassium. Known for high water retention.',
            ),
            _buildInfoCard(
              context,
              title: 'Planting Time',
              icon: Icons.calendar_today,
              content: 'Best planted in summer, after the last frost. Ideal months: May - June.',
            ),
            _buildInfoCard(
              context,
              title: 'Soil Composition',
              icon: Icons.format_list_bulleted,
              content: 'Black soil contains high amounts of clay, organic matter, and minerals, making it rich and fertile for crop cultivation.',
            ),
            _buildInfoCard(
              context,
              title: 'Benefits of Black Soil',
              icon: Icons.star,
              content: 'This soil retains moisture, supports better plant growth, and reduces the need for frequent irrigation, making it highly beneficial for crops.',
            ),
            _buildInfoCard(
              context,
              title: 'Uses of Black Soil',
              icon: Icons.shopping_cart,
              content: 'Ideal for growing crops like cotton, soybeans, maize, groundnut, and vegetables. Commonly used in agriculture for its high fertility.',
            ),
            const SizedBox(height: 20),
            // Learn More Button
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Explore more about Black Soil!')),
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
