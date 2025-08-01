import 'package:flutter/material.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String phoneNumber;

  const WelcomeScreen({super.key, required this.phoneNumber});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Welcome to ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Mobile Number: ${widget.phoneNumber}",
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(width: 5),
                TextButton(
                  onPressed: () {
                    // TODO: Handle edit
                  },
                  child: const Text("Edit", style: TextStyle(color: Colors.yellow)),
                ),
              ],
            ),
            const Text(
              "OTP will be sent to this number for verification",
              style: TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 30),

            // Email input
            _buildInputField("Email ID*", _emailController),
            const SizedBox(height: 20),

            // Name input
            _buildInputField("Name*", _nameController),
            const SizedBox(height: 20),

            const Text("Gender", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildGenderButton("Female"),
                const SizedBox(width: 12),
                _buildGenderButton("Male"),
              ],
            ),

            const SizedBox(height: 30),
            const Text.rich(
              TextSpan(
                text: "By Signing In, I agree to ",
                style: TextStyle(color: Colors.white60),
                children: [
                  TextSpan(
                    text: "Terms & Conditions",
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(text: " and "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.yellow),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // Navigate or Submit
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.black26,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildGenderButton(String gender) {
    final isSelected = selectedGender == gender;
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.yellow : Colors.transparent,
          side: const BorderSide(color: Colors.yellow),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
        child: Text(
          gender,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
