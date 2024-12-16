import 'package:flutter/material.dart';
import 'package:myapp/screens/crop_screen.dart';
import 'soil_screen.dart'; // Import the SoilScreen
import 'account_screen.dart'; // Import the AccountScreen (where profile screen will be)

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color(0xFF00A86B),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                // Navigate to SoilScreen when the "Ask" button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SoilScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Ask',
                style: TextStyle(
                  color: Color(0xFF00A86B),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main Body Content
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage('assets/background.png'), // Update path as needed
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.green.withOpacity(0.8),
                  BlendMode.overlay,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category: Crops
                    _buildCategoryCard(
                      context,
                      'Crops',
                      'assets/crops.png', // Update path as needed
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CropScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    // Category: Location
                    _buildCategoryCard(
                      context,
                      'Location',
                      'assets/location.png', // Update path as needed
                      () {
                        // Add location action
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Fixed Profile Icon at the Bottom Right Corner
          Positioned(
            bottom: 20, // 20 pixels from the bottom
            right: 20,  // 20 pixels from the right
            child: GestureDetector(
              onTap: () {
                // Navigate to AccountScreen when profile icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountScreen()),
                );
              },
              child: _profileIcon(),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build a fixed profile icon
  Widget _profileIcon() {
    return CircleAvatar(
      radius: 30, // Circular size for the profile icon
      backgroundColor: Colors.black, // Background color for the profile icon
      child: Icon(
        Icons.person_outline, // User profile icon
        color: Colors.white,  // Icon color white for clarity
        size: 20,  // Icon size
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String imageUrl,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
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
              imageUrl,
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 20),
            Text(
              title,
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
