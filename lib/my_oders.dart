import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// Active Orders
          const Text(
            "ACTIVE ORDERS",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.orange),
              title: const Text("Order #12345"),
              subtitle: const Text("Placed on: 07 Sep 2025\nStatus: Out for Delivery"),
              trailing: TextButton(
                onPressed: () {},
                child: const Text("TRACK"),
              ),
            ),
          ),

          /// Divider
          const SizedBox(height: 20),

          /// Past Orders
          const Text(
            "PAST ORDERS",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.green),
              title: const Text("Order #12344"),
              subtitle: const Text("Placed on: 01 Sep 2025\nStatus: Delivered"),
              trailing: TextButton(
                onPressed: () {},
                child: const Text("VIEW"),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.red),
              title: const Text("Order #12343"),
              subtitle: const Text("Placed on: 25 Aug 2025\nStatus: Cancelled"),
              trailing: TextButton(
                onPressed: () {},
                child: const Text("VIEW"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
