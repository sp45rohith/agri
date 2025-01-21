import 'package:flutter/material.dart';
import 'recommendations_screen.dart'; // Import the RecommendationsScreen

class SoilAnalysisScreen extends StatefulWidget {
  @override
  _SoilAnalysisScreenState createState() => _SoilAnalysisScreenState();
}

class _SoilAnalysisScreenState extends State<SoilAnalysisScreen> {
  TextEditingController _phController = TextEditingController();
  TextEditingController _textureController = TextEditingController();

  List<String> _recommendedCrops = [];
  String _selectedTexture = ''; // Default value for dropdown
  String _selectedLocation = ''; // Default value for location dropdown

  // Simulated API response (Replace with real API call later)
  List<Map<String, dynamic>> crops = [
    {'name': 'Wheat', 'pH': [6.0, 7.5], 'texture': ['Loamy']},
    {'name': 'Rice', 'pH': [5.5, 6.5], 'texture': ['Clayey', 'Loamy']},
    {'name': 'Peanuts', 'pH': [6.0, 7.0], 'texture': ['Sandy']},
  ];

  void _getRecommendations() {
    double pH = double.parse(_phController.text);
    String texture = _textureController.text;

    List<String> recommendations = [];
    for (var crop in crops) {
      if (pH >= crop['pH'][0] &&
          pH <= crop['pH'][1] &&
          crop['texture'].contains(texture)) {
        recommendations.add(crop['name']);
      }
    }

    setState(() {
      _recommendedCrops = recommendations;
    });
  }

  void _navigateToRecommendations() {
    // Validate input fields before navigating
    if (_phController.text.isEmpty || _selectedTexture.isEmpty || _selectedLocation.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields and select a location.'),
        ),
      );
      return;
    }

    double pH = double.parse(_phController.text);
    String texture = _selectedTexture;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecommendationsScreen(
          pH: pH,
          texture: texture,
          location: _selectedLocation, // Pass the selected location
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soil Analysis'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Soil Analysis',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A86B),
                ),
              ),
              const SizedBox(height: 20),
              // pH Input Field
              TextField(
                controller: _phController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Enter pH level of soil',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Soil Texture Dropdown Field
              DropdownButtonFormField<String>(
                value: _selectedTexture.isNotEmpty ? _selectedTexture : null,
                hint: const Text('Select soil texture'),
                items: ['Loamy', 'Clayey', 'Sandy'].map((String texture) {
                  return DropdownMenuItem<String>(
                    value: texture,
                    child: Text(texture),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedTexture = newValue!;
                    _textureController.text = _selectedTexture;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Select Soil Texture',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Location Dropdown Field
              DropdownButtonFormField<String>(
                value: _selectedLocation.isNotEmpty ? _selectedLocation : null,
                hint: const Text('Select Location'),
                items: [
                  'Thanjavur',
                  'Erode',
                  'Coimbatore',
                  'Salem',
                  'Madurai',
                  'Thiruchi',
                  'Nagapattinam',
                  'Theni',
                  'Villupuram',
                ].map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Select Location',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToRecommendations,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A86B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Get Recommendations'),
              ),
              const SizedBox(height: 20),
              if (_recommendedCrops.isNotEmpty)
                const Text(
                  'Recommended Crops:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 10),
              ..._recommendedCrops.map((crop) => Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    elevation: 5,
                    child: ListTile(
                      title: Text(crop),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
