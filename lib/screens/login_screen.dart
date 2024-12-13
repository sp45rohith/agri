import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void navigateTo(BuildContext context, String userType) {
    // Example navigation logic based on user type
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceholderScreen(userType: userType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage('https://dashboard.codeparrot.ai/api/assets/Z1kZYG6v0cxbqCDW'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Admin Login Section
              GestureDetector(
                onTap: () => navigateTo(context, 'Admin'),
                child: Column(
                  children: [
                    Container(
                      width: 175,
                      height: 158,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://dashboard.codeparrot.ai/api/assets/Z1kZYG6v0cxbqCDX'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Admin login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100), // Spacing
              // Users Login Section
              GestureDetector(
                onTap: () => navigateTo(context, 'User'),
                child: Column(
                  children: [
                    Container(
                      width: 175,
                      height: 158,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://dashboard.codeparrot.ai/api/assets/Z1kZYW6v0cxbqCDY'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Users login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
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
