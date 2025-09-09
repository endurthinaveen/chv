import 'package:flutter/material.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Coupons", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCouponCard(
            code: "WELCOME50",
            description: "Get 50% OFF on your first order",
            expiry: "Valid till 30 Sep 2025",
          ),
          _buildCouponCard(
            code: "FREESHIP",
            description: "Free Shipping on orders above ₹499",
            expiry: "Valid till 15 Oct 2025",
          ),
          _buildCouponCard(
            code: "DIWALI200",
            description: "Flat ₹200 OFF on orders above ₹999",
            expiry: "Valid till 10 Nov 2025",
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCard({
    required String code,
    required String description,
    required String expiry,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.local_offer, color: Colors.orange, size: 32),
        title: Text(code, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            Text(expiry, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        trailing: TextButton(
          onPressed: () {
            // TODO: Copy to clipboard / Apply coupon
          },
          child: const Text("APPLY"),
        ),
      ),
    );
  }
}
