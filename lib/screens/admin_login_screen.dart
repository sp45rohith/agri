import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'admn_dashboard.dart'; // Make sure to import the AdminDashboard screen

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newUsernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPhoneController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  bool _isPasswordVisible = false; // Track password visibility
  bool _isLoggedIn = false; // Track if the admin is logged in
  bool _isManagingUsers = false; // Flag to show user management form

  // Dummy user list
  final List<String> _usersList = [
    "user1@example.com",
    "user2@example.com",
    "user3@example.com",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: const Color(0xFF00A86B),
        leading: _isLoggedIn
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  setState(() {
                    if (_isManagingUsers) {
                      _isManagingUsers = false; // Exit user management view
                    } else {
                      _isLoggedIn = false; // Log out
                    }
                  });
                },
              )
            : null, // Show back button only if logged in
        centerTitle: true,
        elevation: 4,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo or Title
                    const Text(
                      "Welcome Admin!",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),

                    // Card for login form
                    if (!_isLoggedIn) ...[
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Username field
                            _buildLabel('User Name'),
                            _buildTextField(
                              _usernameController,
                              false,
                              Icons.person, // Icon for username
                            ),
                            const SizedBox(height: 20),

                            // Password field with visibility toggle
                            _buildLabel('Password'),
                            _buildPasswordTextField(),
                            const SizedBox(height: 30),

                            // Login button
                            _buildLoginButton(),
                          ],
                        ),
                      ),
                    ] else ...[
                      // User management section, visible after login
                      if (_isManagingUsers)
                        _buildUserManagementForm()
                      else ...[
                        // Option to manage users
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isManagingUsers = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: const Color(0xFF00A86B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 5,
                          ),
                          child: const Center(
                            child: Text(
                              'Manage Users',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // New "Manage Crops" button
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to AdminDashboard screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AdminDashboard()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: const Color(0xFF00A86B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 5,
                          ),
                          child: const Center(
                            child: Text(
                              'Manage Crops',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ]
                    ],
                  ],
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
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, bool obscureText, IconData icon) {
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
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: obscureText ? 'Enter your password' : 'Enter your username',
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
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
      child: TextField(
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
          hintText: 'Enter your password',
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: const Color(0xFF00A86B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
      ),
      child: const Center(
        child: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('http://172.25.81.223/agric/admin_login.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    final data = jsonDecode(response.body);

    if (data['status'] == 'success') {
      setState(() {
        _isLoggedIn = true;
      });
      Fluttertoast.showToast(msg: "Login successful");
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  Widget _buildUserManagementForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add New User',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildTextField(_newUsernameController, false, Icons.person),
        const SizedBox(height: 10),
        _buildTextField(_newPasswordController, true, Icons.lock),
        const SizedBox(height: 10),
        _buildTextField(_newPhoneController, false, Icons.phone),
        const SizedBox(height: 10),
        _buildTextField(_newEmailController, false, Icons.email),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _addUser,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00A86B),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          child: const Text(
            'Add User',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Existing Users',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _usersList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_usersList[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _usersList.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> _addUser() async {
    final response = await http.post(
      Uri.parse('http://172.25.81.223/agric/add_user.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': _newUsernameController.text,
        'password': _newPasswordController.text,
        'phone': _newPhoneController.text,
        'email': _newEmailController.text,
      }),
    );

    final data = jsonDecode(response.body);

    if (data['status'] == 'success') {
      setState(() {
        _usersList.add(_newEmailController.text);
        _newUsernameController.clear();
        _newPasswordController.clear();
        _newPhoneController.clear();
        _newEmailController.clear();
      });
      Fluttertoast.showToast(msg: "User added successfully");
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }
}
