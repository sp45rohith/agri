import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  final double pH;
  final String texture;
  final String location;

  RecommendationsScreen({
    required this.pH,
    required this.texture,
    required this.location,
  });

  // Define the crop data
  final List<Map<String, dynamic>> crops = [
    {'name': 'Wheat', 'pH': [6.0, 7.5], 'texture': ['Loamy']},
    {'name': 'Rice', 'pH': [5.5, 6.5], 'texture': ['Clayey', 'Loamy']},
    {'name': 'Peanuts', 'pH': [6.0, 7.0], 'texture': ['Sandy']},
    {'name': 'Corn', 'pH': [5.8, 7.0], 'texture': ['Loamy', 'Clayey']},
    {'name': 'Barley', 'pH': [6.0, 8.0], 'texture': ['Loamy']},
  ];

  // Simulated past rainfall data
  final Map<String, List<int>> rainfallData = {
    'Thanjavur': [1200, 1100, 1150],
    'Erode': [950, 900, 920],
    'Coimbatore': [850, 870, 860],
    'Salem': [800, 780, 810],
    'Madurai': [1000, 950, 980],
    'Thiruchi': [1100, 1050, 1070],
    'Nagapattinam': [1300, 1250, 1280],
    'Theni': [1400, 1350, 1380],
    'Villupuram': [950, 920, 940],
  };

  @override
  Widget build(BuildContext context) {
    // Filter crops based on pH and texture
    List<String> recommendedCrops = crops
        .where((crop) =>
            pH >= crop['pH'][0] &&
            pH <= crop['pH'][1] &&
            crop['texture'].contains(texture))
        .map((crop) => crop['name'] as String)
        .toList();

    // Get rainfall data for the selected location
    List<int> locationRainfall = rainfallData[location] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Recommendations'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Based on your soil data (pH: $pH, Texture: $texture) and location ($location), we recommend the following crops:',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              if (recommendedCrops.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedCrops.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(recommendedCrops[index]),
                      ),
                    );
                  },
                )
              else
                const Text(
                  'No crops found for the given soil data.',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              const SizedBox(height: 20),
              Text(
                'Past 3 years rainfall data for $location:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              if (locationRainfall.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: locationRainfall
                      .asMap()
                      .entries
                      .map((entry) => Text('Year ${entry.key + 1}: ${entry.value} mm'))
                      .toList(),
                )
              else
                const Text(
                  'No rainfall data available for the selected location.',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
