import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My Profile', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/user.png'), // Replace with your user image
            ),
            const SizedBox(height: 12),
            const Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text('john.doe@email.com', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 20),
            _buildProfileItem(Icons.shopping_bag, 'My Orders'),
            _buildProfileItem(Icons.favorite_border, 'Wishlist'),
            _buildProfileItem(Icons.settings, 'Settings'),
            _buildProfileItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.yellow),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white30, size: 16),
      onTap: () {},
    );
  }
}
