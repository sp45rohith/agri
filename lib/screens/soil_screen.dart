import 'package:flutter/material.dart';
import 'selectsoil_screen.dart'; // Ensure the path is correct based on your project structure

class SoilScreen extends StatelessWidget {
  const SoilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Light white background
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF0F0F0), // Just the light white background
        ),
        child: Column(
          children: [
            const SizedBox(height: 158),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to SelectSoilScreen when the background is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectSoilScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 340,
                  height: 222,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE1EDE9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Added back a NetworkImage inside "Select Soil"
                          Image.asset(
                            'assets/select soil.png', // Replace with your actual image URL
                            width: 79.22,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Select Soil',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
