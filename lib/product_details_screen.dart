// product_details_screen.dart
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 200),
            const SizedBox(height: 20),
            Text(name, style: const TextStyle(fontSize: 24, color: Colors.white)),
            const SizedBox(height: 8),
            Text(price, style: const TextStyle(fontSize: 20, color: Colors.yellow)),
            const SizedBox(height: 20),
            const Text(
              'This is a beautiful item perfect for your wardrobe. High quality and stylish!',
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Add to cart or buy now logic
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
