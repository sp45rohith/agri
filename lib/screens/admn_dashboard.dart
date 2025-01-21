import 'package:flutter/material.dart';
import 'package:myapp/screens/account_screen.dart';
import 'package:myapp/screens/crop_screen.dart';
import 'package:myapp/screens/selectsoil_screen.dart';
import 'package:myapp/screens/soil_screen.dart';
import 'package:myapp/screens/admin_chat_screen.dart'; // Import AdminChatScreen


class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  String searchText = "";
  List<Note> notes = [];

  // List of categories for admin tasks
  List<Map<String, String>> categories = [
    {'title': 'Manage Crops', 'imageUrl': 'assets/crops.png'},
    {'title': 'Manage Location', 'imageUrl': 'assets/location.png'},
    {'title': 'Manage Soils', 'imageUrl': 'assets/select soil.png'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredCategories = categories
        .where((category) => category['title']!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: const Color(0xFF00A86B),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                // Navigate to AdminChatScreen when the "Ask" button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminChatScreen()),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Admin Header Section
            _buildAdminHeader(),

            // Search Bar
            Padding(
              padding: const EdgeInsets.all(15),
              child: _buildSearchBar(),
            ),

            // Admin Tasks Section
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Admin Tasks',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (filteredCategories.isEmpty)
                    const Text(
                      'No tasks found',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    )
                  else
                    ...filteredCategories.map((category) {
                      return _buildCategoryCard(
                        context,
                        category['title']!,
                        category['imageUrl']!,
                        () {
                          if (category['title'] == 'Manage Crops') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CropScreen()),
                            );
                          } else if (category['title'] == 'Manage Soils') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SelectSoilScreen()),
                            );
                          }
                        },
                      );
                    }).toList(),
                ],
              ),
            ),

            // Notes Section
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Admin Notes',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildNotesBackgroundCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A86B),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccountScreen()),
          );
        },
        child: const Icon(Icons.person),
      ),
    );
  }

  // Admin Header with Name/Role
  Widget _buildAdminHeader() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF00A86B),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome, Admin!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Manage your dashboard efficiently.',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.admin_panel_settings,
              color: const Color(0xFF00A86B),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

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
          hintText: "Search tasks...",
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String imageUrl,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          children: [
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                hintText: 'Add a note...',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addNote,
                ),
              ),
            ),
            const SizedBox(height: 15),
            _buildNotesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            title: Text(notes[index].text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
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
                          decoration: const InputDecoration(hintText: 'Edit your note'),
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
              ],
            ),
          ),
        );
      },
    );
  }

  void _addNote() {
    setState(() {
      notes.add(Note(
        id: DateTime.now().toString(),
        text: _noteController.text,
      ));
      _noteController.clear();
    });
  }

  void _editNote(
    String noteId,
    String newText,
  ) {
    setState(() {
      notes.firstWhere((note) => note.id == noteId).text = newText;
      _noteController.clear();
    });
  }
}

// Model class
class Note {
  String id;
  String text;

  Note({
    required this.id,
    required this.text,
  });
}
