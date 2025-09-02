import 'package:finance_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.grid_view, color: Colors.black),
        title: Text(
          "FLEXIPAY",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔎 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search & Shop anywhere",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            // 🔝 Top Features
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.features
                    .map(
                      (f) => _buildTopItem(
                        f["icon"] as IconData,
                        f["label"].toString(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 20),

            // 🟢 Promo Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade900,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.compare_arrows,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tap to Compare Prices",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Compare prices in one tap!",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // 💰 Stats Row
            Obx(
              () => Row(
                children: controller.stats
                    .map(
                      (s) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _buildStatCard(
                            s["value"].toString(),
                            s["label"].toString(),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 20),

            // 📦 Order Status Row
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.orderStatus
                    .map(
                      (o) => _buildOrderStatus(
                        o["icon"] as IconData,
                        o["label"].toString(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 24),

            // 🏷️ Top Brands
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Brands",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text("See All", style: TextStyle(color: Colors.teal.shade900)),
              ],
            ),
            SizedBox(height: 12),

            // 🔝 Brands Row
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.brands
                    .map(
                      (b) => _buildBrand(
                        b["name"].toString(),
                        b["logo"].toString(),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Widgets
  Widget _buildTopItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.teal.shade900),
        ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildOrderStatus(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, size: 20, color: Colors.teal.shade900),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 11)),
      ],
    );
  }

  Widget _buildBrand(String name, String logoUrl) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(logoUrl),
        ),
        SizedBox(height: 6),
        Text(name, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
