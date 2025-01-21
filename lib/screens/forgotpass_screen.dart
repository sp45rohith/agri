import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: const Color(0xFF00A86B),
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00A86B), Color(0xFF00796B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Main content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey, // Attach the form key here
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username field
                      _buildLabel('Username'),
                      _buildTextField(_usernameController, false, 'Please enter your username'),

                      const SizedBox(height: 30),

                      // New Password field
                      _buildLabel('New Password'),
                      _buildTextField(_newPasswordController, true, 'Please enter your new password'),

                      const SizedBox(height: 30),

                      // Confirm Password field
                      _buildLabel('Confirm Password'),
                      _buildTextField(_confirmPasswordController, true, 'Please confirm your new password'),

                      const SizedBox(height: 16),

                      // Confirm button
                      _buildConfirmButton(),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
        color: Colors.white,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, bool obscureText, String validationMessage) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationMessage;
          }
          return null;
        },
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
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          if (_newPasswordController.text == _confirmPasswordController.text) {
            final response = await http.post(
              Uri.parse('http://172.25.81.29/agric/reset_password.php'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'username': _usernameController.text,
                'new_password': _newPasswordController.text,
              }),
            );

            final data = jsonDecode(response.body);

            if (data['status'] == 'success') {
              Fluttertoast.showToast(msg: "Password reset successful");
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Success'),
                    content: const Text('Your password has been reset successfully.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                          Navigator.pop(context); // Navigate back after confirmation
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              Fluttertoast.showToast(msg: data['message']);
            }
          } else {
            // Show error if passwords do not match
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Passwords do not match'),
                backgroundColor: Colors.red,
              ),
            );
          }
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
    _usernameController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
