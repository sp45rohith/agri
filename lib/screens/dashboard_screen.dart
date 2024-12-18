import 'package:flutter/material.dart';
import 'package:myapp/screens/crop_screen.dart';
import 'soil_screen.dart'; // Import the SoilScreen
import 'account_screen.dart'; // Import the AccountScreen (where profile screen will be)

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _noteController = TextEditingController(); // Controller for notes input
  String searchText = "";
  List<String> notes = []; // List to store notes

  // List of categories (for filtering)
  List<Map<String, String>> categories = [
    {'title': 'Crops', 'imageUrl': 'assets/crops.png'},
    {'title': 'Location', 'imageUrl': 'assets/location.png'},
    // Add more categories here if needed
  ];

  @override
  Widget build(BuildContext context) {
    // Filter the categories based on search text
    List<Map<String, String>> filteredCategories = categories
        .where((category) => category['title']!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color(0xFF00A86B),
        elevation: 0, // Remove shadow for a cleaner look
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                // Navigate to SoilScreen when the "Ask" button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SoilScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Ask',
                style: TextStyle(
                  color: Color(0xFF00A86B),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main Body Content
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage('assets/background.png'), // Update path as needed
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.green.withOpacity(0.8),
                  BlendMode.overlay,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    _buildSearchBar(),
                    const SizedBox(height: 20),
                    // Display filtered category cards
                    if (filteredCategories.isEmpty)
                      const Text(
                        'No categories found',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    else
                      ...filteredCategories.map((category) {
                        return _buildCategoryCard(
                          context,
                          category['title']!,
                          category['imageUrl']!,
                          () {
                            if (category['title'] == 'Crops') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CropScreen()),
                              );
                            }
                            // Add actions for other categories if needed
                          },
                        );
                      }).toList(),

                    // Notes Section
                    const SizedBox(height: 30),
                    const Text(
                      'Your Notes',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Background Card for Notes Section
                    _buildNotesBackgroundCard(),
                  ],
                ),
              ),
            ),
          ),
          // Fixed Profile Icon at the Bottom Right Corner
          Positioned(
            bottom: 20, // 20 pixels from the bottom
            right: 20, // 20 pixels from the right
            child: GestureDetector(
              onTap: () {
                // Navigate to AccountScreen when profile icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountScreen()),
                );
              },
              child: _profileIcon(),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build a modern, professional profile icon
  Widget _profileIcon() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF00A86B), Colors.green.shade700], // Subtle gradient for a professional look
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 30, // Profile size
        backgroundColor: Colors.transparent, // Remove background color, using gradient instead
        child: Icon(
          Icons.person_outline, // User profile icon
          color: Colors.white, // Icon color for better contrast
          size: 30, // Slightly larger size for better visibility
        ),
      ),
    );
  }

  // Enhanced Search Bar with shadow and rounded corners
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Category Card with gradient background and shadow
  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String imageUrl,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.withOpacity(0.7), Colors.green.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
          children: [
            Image.asset(
              imageUrl,
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build the Notes input field
  Widget _buildNotesInput() {
    return TextField(
      controller: _noteController,
      decoration: InputDecoration(
        hintText: 'Add a note about your crop...',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.add),
          onPressed: _addNote,
        ),
      ),
    );
  }

  // Method to add a note to the notes list
  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        notes.add(_noteController.text);
        _noteController.clear(); // Clear the input field after adding the note
      });
    }
  }

  // Method to build the list of saved notes
  Widget _buildNotesList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          title: Text(
            notes[index],
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.black),
            onPressed: () {
              setState(() {
                notes.removeAt(index); // Remove the note when delete icon is tapped
              });
            },
          ),
        );
      },
    );
  }

  // Method to build the Notes background card with modern design
  Widget _buildNotesBackgroundCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNotesInput(),
          const SizedBox(height: 20),
          _buildNotesList(),
        ],
      ),
    );
  }
}
