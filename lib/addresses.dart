import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Add New Address Button
          TextButton.icon(
            onPressed: () {
              // Navigate to Add Address Screen
            },
            icon: const Icon(Icons.add, color: Colors.blue),
            label: const Text(
              "Add New Address",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),

          // Default Address
          const Text("DEFAULT ADDRESS",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black54)),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: const Text("Endurthi Naveen"),
              subtitle: const Text(
                "600/1 Street Number, Marthanda Nagar, Hafeezpet\n"
                    "Kondapur, Hyderabad - 500084\nTELANGANA\nMobile: 8688690746",
              ),
              trailing: const Chip(
                label: Text("HOME"),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {}, child: const Text("EDIT")),
              TextButton(onPressed: () {}, child: const Text("REMOVE")),
            ],
          ),

          const SizedBox(height: 16),

          // Other Addresses
          const Text("OTHER ADDRESSES",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black54)),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: const Text("Endurthi Naveen"),
              subtitle: const Text(
                "17-189/1, PNO301, sirla hills, Meerpet\n"
                    "K V Rangareddy - 500097",
              ),
              trailing: const Chip(
                label: Text("HOME"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
