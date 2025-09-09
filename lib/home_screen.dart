import 'package:flutter/material.dart';
import 'cartscreen.dart';
import 'favorites.dart';
import 'profile_screen.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;
  int _selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> _topCategories = [
    {'label': 'All'},
    {'label': 'Men'},
    {'label': 'Women'},
    {'label': 'Kids'},
    {'icon': Icons.more_horiz},
  ];

  final Map<String, List<Map<String, String>>> _subCategories = {
    'All': [
      {'label': 'Fashion', 'image': 'assets/images/fashion.png'},
      {'label': 'Beauty', 'image': 'assets/images/beauty.png'},
      {'label': 'Home', 'image': 'assets/images/home.png'},
      {'label': 'Footwear', 'image': 'assets/images/shoes.png'},
      {'label': 'Accessories', 'image': 'assets/images/bag.png'},
    ],
    'Men': [
      {'label': 'T-Shirts', 'image': 'assets/images/men_tshirt.png'},
      {'label': 'Jeans', 'image': 'assets/images/jeans.png'},
      {'label': 'Shoes', 'image': 'assets/images/shoes.png'},
      {'label': 'Watches', 'image': 'assets/images/watch.png'},
    ],
    'Women': [
      {'label': 'Dresses', 'image': 'assets/images/dress.png'},
      {'label': 'Kurtas', 'image': 'assets/images/kurtas.png'},
      {'label': 'Heels', 'image': 'assets/images/redheels.png'},
      {'label': 'Bags', 'image': 'assets/images/bag.png'},
    ],
    'Kids': [
      {'label': 'Tops', 'image': 'assets/images/top.png'},
      {'label': 'Shorts', 'image': 'assets/images/shorts.png'},
      {'label': 'Shoes', 'image': 'assets/images/shoes.png'},
    ],
  };

  final List<String> _bannerImages = [
    'assets/images/hero.png',
    'assets/images/redheels.png',
    'assets/images/summerdress.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % _bannerImages.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedKey = _topCategories[_selectedCategoryIndex]['label'] ?? 'All';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              color: const Color(0xFFFFF3E0),
              child: Row(
                children: const [
                  Icon(Icons.location_on, size: 18, color: Colors.black),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Deliver to endurthi naveen - 17-189/1,PNO301,sirlahills,meerpet',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black),
                ],
              ),
            ),
            Container(
              color: const Color(0xFFFFF3E0),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png', height: 30),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, size: 20, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Search "Midi Skirt"',
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: Colors.black),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesScreen()));
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
                    },
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFFFFD700),
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_topCategories.length, (index) {
                final isSelected = _selectedCategoryIndex == index;
                final tab = _topCategories[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      children: [
                        tab.containsKey('label')
                            ? Text(
                          tab['label'],
                          style: TextStyle(
                            color: isSelected ? const Color(0xFFFF4081) : Colors.white,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 16,
                          ),
                        )
                            : Icon(
                          tab['icon'],
                          color: isSelected ? const Color(0xFFFF4081) : Colors.white,
                        ),
                        if (isSelected)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 24,
                            color: const Color(0xFFFF4081),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 10),
          if (_subCategories.containsKey(selectedKey))
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _subCategories[selectedKey]!.map((subcat) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 28,
                          child: Image.asset(subcat['image']!, height: 30),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subcat['label']!,
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _bannerImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      _bannerImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text('Popular', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildPopularItem(context, 'Red Heels', '₹3,999', 'assets/images/redheels.png'),
              const SizedBox(width: 12),
              _buildPopularItem(context, 'Summer Dress', '₹2,499', 'assets/images/summerdress.png'),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildCategory(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white12,
            radius: 30,
            child: Image.asset(imagePath, height: 30),
          ),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildPopularItem(BuildContext context, String name, String price, String imagePath) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(name: name, price: price, imagePath: imagePath),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(imagePath, height: 100),
                  IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(name, style: const TextStyle(color: Colors.white)),
              Text(price, style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD700),
                  foregroundColor: Colors.black,
                ),
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}