import 'package:doc_app/pages/LayoutPage.dart';
import 'package:flutter/material.dart';
import 'wave_clipper.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isLogin = true; // Toggle between Login and Signup
  final PageController _pageController = PageController();
  int _currentStep = 0;

  final Map<String, dynamic> _formData = {
    'firstName': '',
    'lastName': '',
    'cin': '',
    'phone': '',
    'city': '',
    'address': '',
    'email': '',
    'password': '',
    'gender': '',
    'bloodType': '',
    'allergies': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Wave Top
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF69F0FF), Color(0xFF448FFF), Color(0xFFC415FF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Text(
                  isLogin ? 'Welcome Back!' : 'Create an Account',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Login / Signup Toggle
          _buildToggleButtons(),
          const SizedBox(height: 20),
          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: isLogin
                    ? _buildLoginForm() // Login Form
                    : _buildSignupForm(), // Multi-step Signup Form
              ),
            ),
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isLogin = true; // Show Login Form
            });
          },
          child: Column(
            children: [
              Text(
                'Log in',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isLogin ? Colors.blue : Colors.grey,
                ),
              ),
              if (isLogin)
                Container(
                  height: 4,
                  width: 60,
                  color: Colors.blue,
                ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: () {
            setState(() {
              isLogin = false; // Show Signup Form
              _currentStep = 0;
            });
          },
          child: Column(
            children: [
              Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: !isLogin ? Colors.blue : Colors.grey,
                ),
              ),
              if (!isLogin)
                Container(
                  height: 4,
                  width: 60,
                  color: Colors.blue,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            label: 'Email',
            icon: Icons.email,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Password',
            icon: Icons.lock,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle Login action
                // On submit, navigate to the LayoutPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Layoutpage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Log in'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm() {
    return Column(
      children: [
        // Step Indicator
        _buildStepIndicator(),
        const SizedBox(height: 20),
        // Multi-step Form
        SizedBox(
          height: MediaQuery.of(context).size.height - 400, // Adjust height to fit the screen
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildPersonalInfoForm(),
              _buildMedicalInfoForm(),
              _buildCredentialsForm(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            height: 8,
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: i <= _currentStep ? Colors.blue : Colors.blue.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    );
  }

  Widget _buildPersonalInfoForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildTextField(
            label: 'First Name',
            icon: Icons.person,
            onChanged: (value) => _formData['firstName'] = value,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Last Name',
            icon: Icons.person,
            onChanged: (value) => _formData['lastName'] = value,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'CIN',
            icon: Icons.credit_card,
            onChanged: (value) => _formData['cin'] = value,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Phone Number',
            icon: Icons.phone,
            onChanged: (value) => _formData['phone'] = value,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Address',
            icon: Icons.home,
            onChanged: (value) => _formData['address'] = value,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'City',
            icon: Icons.location_city,
            onChanged: (value) => _formData['city'] = value,
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalInfoForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildDropdown(
            label: 'Gender',
            icon: Icons.person,
            items: ['Male', 'Female'],
            onChanged: (value) => _formData['gender'] = value,
          ),
          const SizedBox(height: 16),
          _buildDropdown(
            label: 'Blood Type',
            icon: Icons.bloodtype,
            items: ['Unknown','A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
            onChanged: (value) => _formData['bloodType'] = value,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Allergies',
            icon: Icons.warning,
            onChanged: (value) => _formData['allergies'] = value,
          ),
        ],
      ),
    );
  }

  Widget _buildCredentialsForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildTextField(
            label: 'Email',
            icon: Icons.email,
            onChanged: (value) => _formData['email'] = value,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Password',
            icon: Icons.lock,
            obscureText: true,
            onChanged: (value) => _formData['password'] = value,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Confirm Password',
            icon: Icons.lock,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    Function(String)? onChanged,
  }) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required IconData icon,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    return DropdownButtonFormField(
      onChanged: (value) => onChanged(value as String),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0), // Add bottom margin here
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _currentStep == 0
                  ? null
                  : () {
                setState(() {
                  _currentStep--;
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: _currentStep == 2
                  ? () {
                // Handle signup form submission
                // On submit, navigate to the LayoutPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Layoutpage()),
                );
              }
                  : () {
                setState(() {
                  _currentStep++;
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: Text(_currentStep == 2 ? 'Submit' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}