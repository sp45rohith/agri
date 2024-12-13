import 'package:flutter/material.dart';

class CropScreen extends StatefulWidget {
  final List<Map<String, String>> crops;

  const CropScreen({
    Key? key,
    this.crops = const [
      {'name': 'Potato', 'icon': 'assets/potato.png'},
      {'name': 'Corn Crops', 'icon': 'assets/corn.png'},
      {'name': 'Tomato', 'icon': 'assets/tomato.png'},
      {'name': 'Wheat', 'icon': 'assets/wheat.png'},
      {'name': 'Grapes', 'icon': 'assets/grapes.png'},
      {'name': 'Banana', 'icon': 'assets/banana.png'},
      {'name': 'Paddy', 'icon': 'assets/paddy.png'},
      {'name': 'Apple', 'icon': 'assets/apple.png'},
      {'name': 'Sugarcane', 'icon': 'assets/sugarcane.png'},
    ],
  }) : super(key: key);

  @override
  State<CropScreen> createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  List<Map<String, String>> _filteredCrops = [];

  @override
  void initState() {
    super.initState();
    _filteredCrops = widget.crops; // Initially show all crops
  }

  void _filterCrops(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCrops = widget.crops;
      } else {
        _filteredCrops = widget.crops
            .where((crop) => crop['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Crops'),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: Container(
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
                    hintText: 'Search crops...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Color(0xFF00A86B)),
                  ),
                  onChanged: _filterCrops, // Filter crops dynamically
                ),
              ),
              // Crop List
              Column(
                children: _filteredCrops
                    .map((crop) => _buildCropCard(crop['name']!, crop['icon']!))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCropCard(String cropName, String iconPath) {
    return GestureDetector(
      onTap: () {
        // Handle onTap event
        print('$cropName tapped');
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
              cropName,
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
