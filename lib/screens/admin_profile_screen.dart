import 'package:flutter/foundation.dart'; // Import for kDebugMode
import 'package:flutter/material.dart';
import 'dart:convert'; // Import for jsonEncode and jsonDecode
import 'package:http/http.dart' as http; // Import for http requests
import 'package:fluttertoast/fluttertoast.dart'; // Import for Fluttertoast

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({
    super.key,
    required this.userName, // Make userName required
  });

  final String userName;

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  late TextEditingController profileNameController;
  late TextEditingController emailController;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    profileNameController = TextEditingController();
    emailController = TextEditingController();
    _fetchProfileData(); // Fetch profile data on init
  }

  Future<void> _fetchProfileData() async {
    final response = await http.post(
      Uri.parse('http://172.25.81.29/agric/get_admin_profile.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': widget.userName}),
    );

    final data = jsonDecode(response.body);

    if (data['status'] == 'success') {
      setState(() {
        profileNameController.text = data['data']['username'];
        emailController.text = data['data']['email'];
      });
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  @override
  void dispose() {
    profileNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Profile"),
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

              // Editable Profile Picture Section
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: const NetworkImage(
                      'https://dashboard.codeparrot.ai/api/assets/Z11JcxvKm34NfulX',
                    ),
                  ),
                  if (isEditing)
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          // Handle profile picture edit action here
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF00A86B),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 20),

              // Editable fields
              _buildInputSection("Profile Name", profileNameController),
              const SizedBox(height: 20),
              _buildInputSection("User Name", TextEditingController(text: widget.userName), enabled: false),
              const SizedBox(height: 20),
              _buildInputSection("E-mail", emailController),
              const SizedBox(height: 40),

              // Save Button
              if (isEditing)
                ElevatedButton(
                  onPressed: () {
                    // Handle save action here
                    if (kDebugMode) {
                      print("Profile Name: ${profileNameController.text}");
                      print("User Name: ${widget.userName}");
                      print("E-mail: ${emailController.text}");
                    }
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
      String label, TextEditingController textEditingController, {bool enabled = true}) {
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
            enabled: isEditing && enabled,
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
