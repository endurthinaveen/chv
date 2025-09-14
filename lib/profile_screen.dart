import 'package:flutter/material.dart';

import 'addresses.dart';
import 'coupons.dart';
import 'favorites.dart';
import 'my_oders.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            const SizedBox(height: 12),
            const Text(
              'John Doe',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              'john.doe@email.com',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),

            // Profile Items
            _buildProfileItem(
              context,
              Icons.location_on_outlined,
              'My Address',
              const AddressScreen(),
            ),
            _buildProfileItem(
              context,
              Icons.shopping_bag_outlined,
              'My Orders',
              const OrdersScreen(),
            ),

            _buildProfileItem(
              context,
              Icons.card_giftcard_outlined,
              'Coupons',
              const CouponsScreen(),
            ),
            _buildProfileItem(
              context,
              Icons.favorite_border,
              'Wishlist',
              const FavoritesScreen(),
            ),
            _buildProfileItem(
              context,
              Icons.payment_outlined,
              'Payments',
              null,
            ),
            _buildProfileItem(
              context,
              Icons.redeem_outlined,
              'Earn & Redeem',
              null,
            ),
            _buildProfileItem(
              context,
              Icons.help_outline,
              'Help Center',
              null,
            ),
            _buildProfileItem(
              context,
              Icons.description_outlined,
              'Terms & Conditions',
              null,
            ),
            _buildProfileItem(
              context,
              Icons.settings,
              'Settings',
              null,
            ),
            _buildProfileItem(
              context,
              Icons.logout,
              'Logout',
              null,
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Profile Item Widget
  Widget _buildProfileItem(
      BuildContext context, IconData icon, String label, Widget? screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.yellow),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios,
          color: Colors.white30, size: 16),
      onTap: () {
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
    );
  }
}