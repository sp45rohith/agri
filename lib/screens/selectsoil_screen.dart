import 'package:flutter/material.dart';
import 'black_soil_detail_screen.dart'; // Import the Black Soil Detail Screen
import 'chat_screen.dart'; // Import the ChatScreen

class SelectSoilScreen extends StatefulWidget {
  final List<Map<String, String>> soils;

  const SelectSoilScreen({
    Key? key,
    this.soils = const [
      {'name': 'Black Soil', 'icon': 'assets/black.png'},
      {'name': 'Red Soil', 'icon': 'assets/red.png'},
      {'name': 'Alluvial Soil', 'icon': 'assets/alluvial.png'},
      {'name': 'Forest Soil', 'icon': 'assets/forest.png'},
      {'name': 'Desert Soil', 'icon': 'assets/desert.png'},
      {'name': 'Podzol Soil', 'icon': 'assets/podzol.png'},
      {'name': 'Saline-Alkali Soil', 'icon': 'assets/salinealkaline.png'},
      {'name': 'Andosol Soil', 'icon': 'assets/andosol.png'},
      {'name': 'Tundra Soil', 'icon': 'assets/tundra.png'},
    ],
  }) : super(key: key);

  @override
  State<SelectSoilScreen> createState() => _SelectSoilScreenState();
}

class _SelectSoilScreenState extends State<SelectSoilScreen> {
  List<Map<String, String>> _filteredSoils = [];

  @override
  void initState() {
    super.initState();
    _filteredSoils = widget.soils; // Initially show all soil types
  }

  void _filterSoils(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredSoils = widget.soils;
      } else {
        _filteredSoils = widget.soils
            .where((soil) => soil['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Soil Type'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: AssetImage('assets/background.png'), // Update path as needed
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
                        hintText: 'Search soil types...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Color(0xFF00A86B)),
                      ),
                      onChanged: _filterSoils, // Filter soil types dynamically
                    ),
                  ),
                  // Soil List
                  Column(
                    children: _filteredSoils
                        .map((soil) => _buildSoilCard(soil['name']!, soil['icon']!))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          // Draggable Chatbot Icon
          Positioned(
            bottom: 20,
            right: 20,
            child: Draggable(
              feedback: _chatbotIcon(),
              childWhenDragging: Container(),
              child: GestureDetector(
                onTap: () {
                  // Navigate to Chat Screen on tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                  );
                },
                child: _chatbotIcon(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoilCard(String soilName, String iconPath) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective soil detail screen
        if (soilName == 'Black Soil') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BlackSoilDetailScreen()),
          );
        }
        // Add additional conditions for other soil types
        else if (soilName == 'Red Soil') {
          // Navigate to Red Soil Detail Screen (Create this screen similarly)
        } else if (soilName == 'Alluvial Soil') {
          // Navigate to Alluvial Soil Detail Screen
        } // You can keep adding conditions for each soil type
      },
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
              iconPath,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 20),
            Text(
              soilName,
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

  Widget _chatbotIcon() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        Icons.chat,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
