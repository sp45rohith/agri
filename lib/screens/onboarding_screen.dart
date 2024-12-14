import 'package:flutter/material.dart';
import 'admin_login_screen.dart';
import 'user_login_screen.dart'; // Assuming you have a user login screen

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Admin Login Section
            Positioned(
              top: size.height * 0.25,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to Admin Login Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminLoginScreen()),
                      );
                    },
                    child: Container(
                      width: size.width * 0.8,  // Increase width for better visibility
                      height: size.height * 0.12, // Adjust height for better balance
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.admin_panel_settings,
                            size: size.width * 0.1, // Adjust icon size
                            color: const Color(0xFF1A1E1E),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            'Admin login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * 0.06, // Increase text size for readability
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),

            // User Login Section
            Positioned(
              top: size.height * 0.6,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to User Login Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserLoginScreen()),
                      );
                    },
                    child: Container(
                      width: size.width * 0.8,  // Increase width for better visibility
                      height: size.height * 0.12, // Adjust height for better balance
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: size.width * 0.1, // Adjust icon size
                            color: const Color(0xFF1A1E1E),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            'Users login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * 0.06, // Increase text size for readability
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
