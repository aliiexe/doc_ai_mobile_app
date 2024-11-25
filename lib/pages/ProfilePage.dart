import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  // Sample user data
  final String _userName = "John Doe";
  final String _userEmail = "johndoe@example.com";
  final String _profilePictureUrl =
      "https://picsum.photos/200"; // Profile picture URL
  final String _emergencyNumber = "123-456-7890";
  final String _city = "New York";
  final String _address = "1234 Elm Street, Apartment 5B";
  final String _gender = "Male";
  final String _dob = "January 1, 1990";
  final String _bloodType = "O+";
  final String _allergies = "Nuts, Ibuprofen, Oysters, Pollen, Nuts, Ibuprofen, Oysters, Pollen"; // Example allergies

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        color: Colors.white,
        child: ListView(
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(_profilePictureUrl),
                backgroundColor: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 20),

            // User Name
            Text(
              _userName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // User Email
            Text(
              _userEmail,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),

            // Emergency Number
            ProfileDetailTile(
              title: "Emergency Number",
              value: _emergencyNumber,
            ),
            const SizedBox(height: 16),

            // City and Address
            ProfileDetailTile(
              title: "City",
              value: _city,
            ),
            ProfileDetailTile(
              title: "Address",
              value: _address,
            ),
            const SizedBox(height: 16),

            // Gender
            ProfileDetailTile(
              title: "Gender",
              value: _gender,
            ),
            const SizedBox(height: 16),

            // Date of Birth
            ProfileDetailTile(
              title: "Date of Birth",
              value: _dob,
            ),
            const SizedBox(height: 16),

            // Blood Type
            ProfileDetailTile(
              title: "Blood Type",
              value: _bloodType,
            ),
            const SizedBox(height: 16),

            // Allergies
            ProfileDetailTile(
              title: "Allergies",
              value: _allergies,
              isMultiline: true, // Allow multi-line for allergies info
            ),
            const SizedBox(height: 30),

            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Logic to edit profile
              },
              child: const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Button color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Logout Button
            ElevatedButton(
              onPressed: () {
                // Logic for logout
              },
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400], // Button color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget to display profile details
class ProfileDetailTile extends StatelessWidget {
  final String title;
  final String value;
  final bool isMultiline; // New parameter to handle multi-line text

  const ProfileDetailTile({
    required this.title,
    required this.value,
    this.isMultiline = false, // Default is single line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column( // Changed from Row to Column
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            maxLines: isMultiline ? null : 1, // Handle multi-line if needed
            softWrap: true, // Ensure the text wraps
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
