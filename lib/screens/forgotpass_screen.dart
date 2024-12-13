import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
            image: NetworkImage(
                'https://dashboard.codeparrot.ai/api/assets/Z1kqX4OQ_MXMs9od'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.green,
              BlendMode.overlay,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 150, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // New Password field
                _buildLabel('New Password'),
                _buildTextField(_newPasswordController, true),

                const SizedBox(height: 30),

                // Confirm Password field
                _buildLabel('Confirm Password'),
                _buildTextField(_confirmPasswordController, true),

                const SizedBox(height: 16),

                // Confirm button
                _buildConfirmButton(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, bool obscureText) {
    return Container(
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
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () {
        if (_newPasswordController.text == _confirmPasswordController.text) {
          // Handle password reset logic here
          Navigator.pop(context); // Navigate back after confirmation
        } else {
          // Show error if passwords do not match
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Passwords do not match'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00A86B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
      ),
      child: const Center(
        child: Text(
          'Confirm Password',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
