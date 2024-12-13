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
                      width: size.width * 0.35,
                      height: size.width * 0.35,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        size: size.width * 0.15,
                        color: const Color(0xFF1A1E1E),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Admin login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Users Login Section
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
                      width: size.width * 0.35,
                      height: size.width * 0.35,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.people_outline,
                        size: size.width * 0.15,
                        color: const Color(0xFF1A1E1E),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Users login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
