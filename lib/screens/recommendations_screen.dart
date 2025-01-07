import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  final double pH;
  final String texture;

  RecommendationsScreen({required this.pH, required this.texture});

  @override
  Widget build(BuildContext context) {
    // Dummy data for recommended crops (replace with real logic or API call)
    List<String> recommendedCrops = ['Wheat', 'Rice', 'Peanuts'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Based on your soil data (pH: $pH, Texture: $texture), we recommend the following crops:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Display recommended crops
            ListView.builder(
              shrinkWrap: true,  // To prevent overflow issues
              itemCount: recommendedCrops.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(recommendedCrops[index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
