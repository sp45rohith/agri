import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void navigateTo(BuildContext context, String userType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceholderScreen(userType: userType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive padding and button size
    double buttonWidth = screenWidth * 0.8; // Buttons will take 80% of screen width
    double buttonHeight = screenHeight * 0.1; // Buttons will be 10% of screen height
    double iconSize = screenWidth * 0.1; // Icons will be scaled based on screen width

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Admin Login Section with Translucent Button
              GestureDetector(
                onTap: () => navigateTo(context, 'Admin'),
                child: Container(
                  width: buttonWidth,
                  height: buttonHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.2), // Translucent white
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5), // Semi-transparent border
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.admin_panel_settings,
                        color: Colors.white,
                        size: iconSize,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Admin Login',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // User Login Section with Translucent Button
              GestureDetector(
                onTap: () => navigateTo(context, 'User'),
                child: Container(
                  width: buttonWidth,
                  height: buttonHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.2), // Translucent white
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5), // Semi-transparent border
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: iconSize,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'User Login',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String userType;
  const PlaceholderScreen({Key? key, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$userType Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the $userType Screen!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
