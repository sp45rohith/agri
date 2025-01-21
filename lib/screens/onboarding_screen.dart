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
            image: AssetImage('assets/onboarding.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
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
                      width: size.width * 0.8, // Increase width for better visibility
                      height: size.height * 0.12, // Adjust height for better balance
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // Translucent effect
                        border: Border.all(
                          color: Colors.white.withOpacity(0.5), // Semi-transparent border
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: size.width * 0.1, // Adjust icon size
                            color: Colors.white,
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * 0.06, // Increase text size for readability
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
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
