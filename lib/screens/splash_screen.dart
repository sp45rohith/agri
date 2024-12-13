import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds and then navigate to the home page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC4C4C4),
      body: SafeArea(
        child: Stack(
          children: [
            // Background container with rounded corners
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            
            // Status bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.165,
                        color: const Color(0xFF1A1E1E),
                      ),
                    ),
                    // Battery, WiFi icons would go here
                  ],
                ),
              ),
            ),

            // Main content - Plant illustration
            Center(
              child: Container(
                width: 360,
                height: 856,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0FFFF), // Light cyan background
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage('assets/1.png'), // Replace with your image asset path
                    fit: BoxFit.cover,
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

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0FFFF),
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
