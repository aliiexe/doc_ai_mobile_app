import 'package:flutter/material.dart';

class Compatibilitypage extends StatefulWidget {
  const Compatibilitypage({super.key});

  @override
  State<Compatibilitypage> createState() => _CompatibilitypageState();
}

class _CompatibilitypageState extends State<Compatibilitypage> {
  final TextEditingController _medication1Controller = TextEditingController();
  final TextEditingController _medication2Controller = TextEditingController();
  String _compatibilityResult = '';
  Color _resultColor = Colors.black;

  // Sample data: Example of medication compatibility
  final Map<String, List<String>> compatibilityData = {
    'Amlodipine': ['Lisinopril', 'Metformin'],
    'Lisinopril': ['Amlodipine'],
    'Metformin': ['Lisinopril'],
    'Aspirin': ['Ibuprofen'], // Example incompatible pair
    'Ibuprofen': ['Aspirin'],
  };

  // Function to check compatibility
  void checkCompatibility() {
    final medication1 = _medication1Controller.text.trim();
    final medication2 = _medication2Controller.text.trim();

    if (medication1.isEmpty || medication2.isEmpty) {
      setState(() {
        _compatibilityResult = 'Please enter both medications.';
        _resultColor = Colors.orange;
      });
      return;
    }

    if (compatibilityData.containsKey(medication1) &&
        compatibilityData[medication1]!.contains(medication2)) {
      setState(() {
        _compatibilityResult = '$medication1 and $medication2 are compatible.';
        _resultColor = Colors.green; // Compatible result in green
      });
    } else {
      setState(() {
        _compatibilityResult = '$medication1 and $medication2 are NOT compatible.';
        _resultColor = Colors.red; // Incompatible result in red
      });
    }
  }

  // Function to clear input fields and result
  void clearFields() {
    _medication1Controller.clear();
    _medication2Controller.clear();
    setState(() {
      _compatibilityResult = '';
      _resultColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medication Compatibility',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white, // Set the body background color to white
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Medication 1 Input
            const Text(
              'Enter Medication 1:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _medication1Controller,
              decoration: InputDecoration(
                hintText: 'Enter the first medication',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Medication 2 Input
            const Text(
              'Enter Medication 2:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _medication2Controller,
              decoration: InputDecoration(
                hintText: 'Enter the second medication',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              ),
            ),
            const SizedBox(height: 24),

            // Check Compatibility Button
            ElevatedButton(
              onPressed: checkCompatibility,
              child: const Text(
                'Check Compatibility',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Button color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Clear Button
            ElevatedButton(
              onPressed: clearFields,
              child: const Text(
                'Clear Fields',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400], // Button color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Display Compatibility Result
            Text(
              _compatibilityResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _resultColor, // Color based on result
              ),
            ),
          ],
        ),
      ),
    );
  }
}
