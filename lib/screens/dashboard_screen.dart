import 'package:flutter/material.dart';
import 'package:myapp/screens/account_screen.dart';
import 'package:myapp/screens/crop_screen.dart';
import 'package:myapp/screens/selectsoil_screen.dart';
import 'package:myapp/screens/soil_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _noteController = TextEditingController(); // Controller for notes input
  String searchText = "";
  List<Note> notes = []; // List to store notes as objects

  // List of categories (for filtering)
  List<Map<String, String>> categories = [
    {'title': 'Crops', 'imageUrl': 'assets/crops.png'},
    {'title': 'Location', 'imageUrl': 'assets/location.png'},
    {'title': 'Soils', 'imageUrl': 'assets/select soil.png'}, // Added the Soils category
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
                            } else if (category['title'] == 'Soils') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SelectSoilScreen()), // Navigate to SelectSoilScreen
                              );
                            }
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
        notes.add(Note(text: _noteController.text, id: DateTime.now().toString()));
        _noteController.clear(); // Clear the input field after adding the note
      });
    }
  }

  // Method to delete a note
  void _deleteNote(String id) {
    setState(() {
      notes.removeWhere((note) => note.id == id); // Remove note with matching ID
    });
  }

  // Method to edit a note
  void _editNote(String id, String newText) {
    setState(() {
      Note note = notes.firstWhere((note) => note.id == id);
      note.text = newText; // Update the note text
    });
  }

  // Method to build the list of saved notes with delete and edit option
  Widget _buildNotesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notes[index].text),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _noteController.text = notes[index].text;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Edit Note'),
                            content: TextField(
                              controller: _noteController,
                              decoration: InputDecoration(hintText: 'Edit your note'),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  _editNote(notes[index].id, _noteController.text);
                                  Navigator.pop(context);
                                },
                                child: const Text('Save'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteNote(notes[index].id),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Method to build the background card for Notes
  Widget _buildNotesBackgroundCard() {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotesInput(),
            const SizedBox(height: 15),
            _buildNotesList(),
          ],
        ),
      ),
    );
  }
}

// Note class to represent each note
class Note {
  String text;
  String id;

  Note({
    required this.text,
    required this.id,
  });
}
