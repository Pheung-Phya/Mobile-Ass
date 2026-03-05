import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["Offers", "Burger", "Pizza", "Donut", "Drink"];

    final products = const [
      _FoodItem(
        name: "Classic Burger",
        price: 12.75,
        rating: 4.7,
        // replace with your asset/network image later
        imageUrl:
            "https://images.unsplash.com/photo-1550547660-d9450f859349?w=800",
      ),
      _FoodItem(
        name: "Cola",
        price: 3.99,
        rating: 4.4,
        imageUrl:
            "https://images.unsplash.com/photo-1622480409729-2e7d5a7f6b52?w=800",
      ),
      _FoodItem(
        name: "Donuts",
        price: 6.25,
        rating: 4.6,
        imageUrl:
            "https://images.unsplash.com/photo-1514516870926-2051bdb7dd07?w=800",
      ),
      _FoodItem(
        name: "Beef Burger",
        price: 10.50,
        rating: 4.5,
        imageUrl:
            "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800",
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hi Puthi",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7C7C7C),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "What are you carving?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111111),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const _Avatar(),
                ],
              ),

              const SizedBox(height: 14),

              // Search
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE8E8E8)),
                ),
                child: Row(
                  children: const [
                    SizedBox(width: 12),
                    Icon(Icons.search, color: Color(0xFF9E9E9E)),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "search...",
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Promo Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7EFE4),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "35% OFF on\nBurgers!",
                            style: TextStyle(
                              fontSize: 20,
                              height: 1.1,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1B1B1B),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2E8B2B),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                              ),
                              child: const Text(
                                "Buy now",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Right illustration placeholder (replace with Image.asset)
                    Container(
                      width: 110,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.55),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(Icons.fastfood, size: 34),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Categories (chips)
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, i) {
                    final isActive = i == 0; // Offers selected like screenshot
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xFFE9EEE8)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isActive
                              ? Colors.transparent
                              : const Color(0xFFE8E8E8),
                        ),
                      ),
                      child: Text(
                        categories[i],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isActive
                              ? const Color(0xFF2B2B2B)
                              : const Color(0xFF7A7A7A),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 14),

              // Grid products
              GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, i) => _FoodCard(item: products[i]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------- Components -------------------- */

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: const Center(
        child: CircleAvatar(
          radius: 16,
          backgroundColor: Color(0xFFEDEDED),
          child: Icon(Icons.person, color: Color(0xFF444444)),
        ),
      ),
    );
  }
}

class _FoodCard extends StatelessWidget {
  final _FoodItem item;
  const _FoodCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            blurRadius: 18,
            spreadRadius: 0,
            offset: Offset(0, 8),
            color: Color(0x12000000),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(item.imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Color(0xFFF5A623),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.rating.toStringAsFixed(1),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Info
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "\$${item.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9EEE8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFF2E8B2B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodItem {
  final String name;
  final double price;
  final double rating;
  final String imageUrl;

  const _FoodItem({
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });
}
