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
              // Admin Login Section with Gradient Background
              GestureDetector(
                onTap: () => navigateTo(context, 'Admin'),
                child: Container(
                  width: buttonWidth, // Adjust width for responsive button size
                  height: buttonHeight, // Adjust height for responsive button size
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.lightGreenAccent], // Gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.admin_panel_settings,
                        color: Colors.white, // Icon color changed to white
                        size: iconSize, // Responsive icon size
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Admin Login',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05, // Responsive text size
                          fontWeight: FontWeight.w700,
                          color: Colors.white, // Changed to white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30), // Adjusted spacing between buttons

              // User Login Section with Gradient Background
              GestureDetector(
                onTap: () => navigateTo(context, 'User'),
                child: Container(
                  width: buttonWidth, // Adjust width for responsive button size
                  height: buttonHeight, // Adjust height for responsive button size
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.lightBlueAccent], // Gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white, // Icon color changed to white
                        size: iconSize, // Responsive icon size
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'User Login',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05, // Responsive text size
                          fontWeight: FontWeight.w700,
                          color: Colors.white, // Changed to white
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
