import 'package:flutter/material.dart';

class TrichyScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const TrichyScreen({
    Key? key,
    this.title = 'Trichy Crops',
    this.imageUrl = 'assets/trichy.png',
    this.description = 'Trichy is known for banana plantations and paddy cultivation.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                      'Trichy',
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
                  child: Image.network(
                    imageUrl,
                    width: 200,
                    height: 153,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfoCard(
                  context,
                  title: 'Crops Grown',
                  icon: Icons.grain,
                  content:
                      '• Primary: Banana, Paddy\n• Secondary: Coconut, Cotton.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Soil Type',
                  icon: Icons.grass,
                  content: 'Alluvial soils, ideal for banana cultivation.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Irrigation',
                  icon: Icons.water,
                  content:
                      'Irrigation supported by the Cauvery Delta system.',
                ),
                _buildInfoCard(
                  context,
                  title: 'Agricultural Techniques',
                  icon: Icons.agriculture,
                  content:
                      '• Drip irrigation for bananas.\n• Intercropping techniques to maximize yield.',
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Placeholder action
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
