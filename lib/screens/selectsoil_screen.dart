import 'package:flutter/material.dart';

class SelectSoilScreen extends StatelessWidget {
  const SelectSoilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: NetworkImage('https://dashboard.codeparrot.ai/api/assets/Z1uwna_uyZiCJNYY'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 45),
              // Green header
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                height: 68,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Soils',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Search bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.search, size: 30),
                    const SizedBox(width: 8),
                    const Text(
                      'Search Soil type',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Soil type list
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 41),
                  children: const [
                    SoilTypeItem(text: '1. Black soil'),
                    SoilTypeItem(text: '2.Red soil'),
                    SoilTypeItem(text: '3. Alluvail soil'),
                    SoilTypeItem(text: '4.Forest soil'),
                    SoilTypeItem(text: '5.Desert soil'),
                    SoilTypeItem(text: '6.Podzol soil'),
                    SoilTypeItem(text: '7.Saline-alkali Soil'),
                    SoilTypeItem(text: '8.Andosol Soil'),
                    SoilTypeItem(text: '9.Tundra Soil'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SoilTypeItem extends StatelessWidget {
  final String text;

  const SoilTypeItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 49,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'Roboto Slab',
          color: Colors.black,
        ),
      ),
    );
  }
}

