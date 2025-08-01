import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String price;
  final String imagePath;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(name: 'Red Heels', price: '₹3,999', imagePath: 'assets/images/redheels.png'),
    CartItem(name: 'Summer Dress', price: '₹2,499', imagePath: 'assets/images/summerdress.png'),
  ];

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      final price = double.tryParse(item.price.replaceAll('₹', '').replaceAll(',', '')) ?? 0;
      total += price * item.quantity;
    }
    return total;
  }

  void _increaseQty(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decreaseQty(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Your Cart', style: TextStyle(color: Colors.white)),
      ),
      body: cartItems.isEmpty
          ? const Center(
        child: Text('Your cart is empty', style: TextStyle(color: Colors.white70, fontSize: 18)),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(item.imagePath, height: 70, width: 70),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: const TextStyle(color: Colors.white, fontSize: 16)),
                            const SizedBox(height: 6),
                            Text(item.price, style: const TextStyle(color: Colors.white70)),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline, color: Colors.white),
                                  onPressed: () => _decreaseQty(index),
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                                  onPressed: () => _increaseQty(index),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                        onPressed: () => _removeItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white12,
              border: Border(top: BorderSide(color: Colors.white30)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('₹${getTotalPrice().toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.yellow, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      // Checkout action
                    },
                    child: const Text('Proceed to Checkout'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
