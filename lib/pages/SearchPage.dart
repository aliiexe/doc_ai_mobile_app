import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchResult = ''; // This variable will hold the search query result

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medications Search',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar with Camera Icon next to it
            Row(
              children: [
                // Search Bar
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search for medications...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSubmitted: (query) {
                      _performSearch(query); // Call search function on submit
                    },
                  ),
                ),
                const SizedBox(width: 16), // Space between search bar and camera icon
                // Camera Icon
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // Show message indicating the camera functionality is disabled
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Camera functionality disabled.')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20), // Space between search bar and results
            // Display the search result here
            if (_searchResult.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Search Result: $_searchResult',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Method to perform the search and update the result
  void _performSearch(String query) {
    setState(() {
      _searchResult = query; // Store the search query in _searchResult
    });
  }
}
