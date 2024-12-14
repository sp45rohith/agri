import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    this.profileName = "",
    this.contactNo = "",
    this.userName = "",
    this.dob = "",
    this.email = "",
  });

  final String profileName;
  final String contactNo;
  final String userName;
  final String dob;
  final String email;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController profileNameController;
  late TextEditingController contactNoController;
  late TextEditingController userNameController;
  late TextEditingController dobController;
  late TextEditingController emailController;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    profileNameController = TextEditingController(text: widget.profileName);
    contactNoController = TextEditingController(text: widget.contactNo);
    userNameController = TextEditingController(text: widget.userName);
    dobController = TextEditingController(text: widget.dob);
    emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    profileNameController.dispose();
    contactNoController.dispose();
    userNameController.dispose();
    dobController.dispose();
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
                          print("Edit Profile Picture Clicked");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00A86B),
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
              _buildInputSection("Contact No.", contactNoController),
              const SizedBox(height: 20),
              _buildInputSection("User Name", userNameController),
              const SizedBox(height: 20),
              _buildInputSection("D.O.B", dobController),
              const SizedBox(height: 20),
              _buildInputSection("E-mail", emailController),
              const SizedBox(height: 40),

              // Save Button
              if (isEditing)
                ElevatedButton(
                  onPressed: () {
                    // Handle save action here
                    print("Profile Name: ${profileNameController.text}");
                    print("Contact No.: ${contactNoController.text}");
                    print("User Name: ${userNameController.text}");
                    print("D.O.B: ${dobController.text}");
                    print("E-mail: ${emailController.text}");
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
