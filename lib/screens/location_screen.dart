import 'package:flutter/material.dart';

// Import all the location screens
import 'thanjavur.dart'; // Import ThanjavurScreen
import 'erode.dart'; // Import ErodeScreen
import 'coimbatore.dart'; // Import CoimbatoreScreen
import 'salem.dart'; // Import SalemScreen
import 'madurai.dart'; // Import MaduraiScreen
import 'trichy.dart'; // Import ThiruchiScreen
import 'nagapattinam.dart'; // Import NagapattinamScreen
import 'theni.dart'; // Import TheniScreen
import 'villupuram.dart'; // Import VillupuramScreen

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<Map<String, String>> _locations = [
    {'name': 'Thanjavur', 'image': 'assets/thanjavur.png'},
    {'name': 'Erode', 'image': 'assets/erode.png'},
    {'name': 'Coimbatore', 'image': 'assets/coimbatore.png'},
    {'name': 'Salem', 'image': 'assets/salem.png'},
    {'name': 'Madurai', 'image': 'assets/madurai.png'},
    {'name': 'Trichy', 'image': 'assets/trichy.png'},
    {'name': 'Nagapattinam', 'image': 'assets/nagapattinam.png'},
    {'name': 'Theni', 'image': 'assets/theni.png'},
    {'name': 'Villupuram', 'image': 'assets/villupuram.png'},
  ];

  List<Map<String, String>> _filteredLocations = [];

  @override
  void initState() {
    super.initState();
    _filteredLocations = _locations; // Initially show all locations
  }

  void _filterLocations(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredLocations = _locations;
      } else {
        _filteredLocations = _locations
            .where((location) =>
                location['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _navigateToLocation(String locationName) {
    // Example navigation based on location
    if (locationName == 'Thanjavur') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThanjavurScreen()),
      );
    } else if (locationName == 'Erode') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ErodeScreen()),
      );
    } else if (locationName == 'Coimbatore') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CoimbatoreScreen()),
      );
    } else if (locationName == 'Salem') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SalemScreen()),
      );
    } else if (locationName == 'Madurai') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MaduraiScreen()),
      );
    } else if (locationName == 'Trichy') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrichyScreen()),
      );
    } else if (locationName == 'Nagapattinam') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NagapattinamScreen()),
      );
    } else if (locationName == 'Theni') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TheniScreen()),
      );
    } else if (locationName == 'Villupuram') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VillupuramScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Details for $locationName are not available yet.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.greenAccent,
              BlendMode.overlay,
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Search Bar
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search locations...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Color(0xFF00A86B)),
                  ),
                  onChanged: _filterLocations, // Filter locations dynamically
                ),
              ),
              // Location List
              Column(
                children: _filteredLocations
                    .map((location) =>
                        _buildLocationCard(location['name']!, location['image']!))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard(String locationName, String imageName) {
    return GestureDetector(
      onTap: () => _navigateToLocation(locationName),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imageName,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported,
                    color: Colors.grey, size: 40);
              },
            ),
            const SizedBox(width: 20),
            Text(
              locationName,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
