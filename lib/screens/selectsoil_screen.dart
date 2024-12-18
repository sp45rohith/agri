import 'package:flutter/material.dart';
import 'black_soil_detail_screen.dart';
import 'red_soil_detail_screen.dart';
import 'alluvial_soil_detail_screen.dart';
import 'forest_soil_detail_screen.dart';
import 'desert_soil_detail_screen.dart';
import 'podzol_soil_detail_screen.dart';
import 'saline_alkali_soil_detail_screen.dart';
import 'andosol_soil_detail_screen.dart';
import 'tundra_soil_detail_screen.dart';
import 'chat_screen.dart';

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
    _filteredSoils = widget.soils;
  }

  void _filterSoils(String query) {
    setState(() {
      _filteredSoils = query.isEmpty
          ? widget.soils
          : widget.soils
              .where((soil) => soil['name']!.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  void _navigateToSoilDetail(String soilName) {
    if (soilName == 'Black Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlackSoilDetailScreen()));
    } else if (soilName == 'Red Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RedSoilDetailScreen()));
    } else if (soilName == 'Alluvial Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AlluvialSoilDetailScreen()));
    } else if (soilName == 'Forest Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForestSoilDetailScreen()));
    } else if (soilName == 'Desert Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const DesertSoilDetailScreen()));
    } else if (soilName == 'Podzol Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PodzolSoilDetailScreen()));
    } else if (soilName == 'Saline-Alkali Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SalineAlkaliSoilDetailScreen()));
    } else if (soilName == 'Andosol Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AndosolSoilDetailScreen()));
    } else if (soilName == 'Tundra Soil') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const TundraSoilDetailScreen()));
    }
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
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.greenAccent, BlendMode.overlay),
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
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search soil types...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Color(0xFF00A86B)),
                      ),
                      onChanged: _filterSoils,
                    ),
                  ),
                  // Soil List
                  Column(
                    children: _filteredSoils
                        .map(
                          (soil) => GestureDetector(
                            onTap: () => _navigateToSoilDetail(soil['name']!),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(soil['icon']!, width: 40, height: 40),
                                  const SizedBox(width: 20),
                                  Text(
                                    soil['name']!,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          // Chatbot Icon
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen())),
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chat, color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
