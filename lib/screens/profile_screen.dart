import 'package:flutter/foundation.dart'; // Import for kDebugMode
import 'package:flutter/material.dart';
import 'dart:convert'; // Import for jsonEncode and jsonDecode
import 'package:http/http.dart' as http; // Import for http requests
import 'package:fluttertoast/fluttertoast.dart'; // Import for Fluttertoast

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController contactNoController;
  late TextEditingController userNameController;
  late TextEditingController emailController;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    contactNoController = TextEditingController();
    userNameController = TextEditingController(text: widget.userName);
    emailController = TextEditingController();
    _fetchProfileData(); // Fetch profile data on init
  }

  Future<void> _fetchProfileData() async {
    try {
      if (kDebugMode) {
        print('Fetching profile data for username: ${widget.userName}');
      }

      final response = await http.post(
        Uri.parse('http://172.25.81.29/agric/get_user_profile.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': widget.userName}),
      );

      if (kDebugMode) {
        print('HTTP status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

      final data = jsonDecode(response.body);

      if (kDebugMode) {
        print('Decoded response: $data');
      }

      if (data['status'] == 'success' && data['data'] != null) {
        setState(() {
          firstNameController.text = data['data']['first_name'] ?? '';
          lastNameController.text = data['data']['last_name'] ?? '';
          contactNoController.text = data['data']['phone'] ?? '';
          emailController.text = data['data']['email'] ?? '';
        });
        if (kDebugMode) {
          print('Profile data fetched: ${data['data']}');
        }
      } else {
        Fluttertoast.showToast(msg: data['message'] ?? "Failed to fetch profile.");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching profile: $e');
      }
      Fluttertoast.showToast(msg: "Failed to fetch profile data.");
    }
  }

  Future<void> _updateProfile() async {
    try {
      final requestBody = jsonEncode({
        'username': widget.userName,
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'contactNo': contactNoController.text,
        'email': emailController.text,
      });

      if (kDebugMode) {
        print('Update request body: $requestBody');
      }

      final response = await http.post(
        Uri.parse('http://172.25.81.29/agric/update_user_profile.php'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      final data = jsonDecode(response.body);

      if (data['status'] == 'success') {
        Fluttertoast.showToast(msg: "Profile updated successfully.");
        if (kDebugMode) {
          print('Profile updated successfully: ${data['message']}');
        }
      } else {
        Fluttertoast.showToast(msg: data['message'] ?? "Failed to update profile.");
        if (kDebugMode) {
          print('Failed to update profile: ${data['message']}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating profile: $e');
      }
      Fluttertoast.showToast(msg: "Failed to update profile.");
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    contactNoController.dispose();
    userNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFF00A86B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            child: Text(
              isEditing ? "Cancel" : "Edit",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Editable fields
              _buildInputSection("First Name", firstNameController),
              const SizedBox(height: 20),
              _buildInputSection("Last Name", lastNameController),
              const SizedBox(height: 20),
              _buildInputSection("Contact No.", contactNoController),
              const SizedBox(height: 20),
              _buildInputSection("User Name", userNameController),
              const SizedBox(height: 20),
              _buildInputSection("E-mail", emailController),
              const SizedBox(height: 40),

              // Save Button
              if (isEditing)
                ElevatedButton(
                  onPressed: () {
                    _updateProfile(); // Call the update API
                    setState(() {
                      isEditing = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A86B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection(
      String label, TextEditingController textEditingController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Roboto Condensed',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          height: 49,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextField(
            controller: textEditingController,
            enabled: isEditing,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }
}