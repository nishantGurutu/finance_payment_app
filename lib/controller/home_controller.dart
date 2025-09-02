import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // 🔝 Top features list
  var features = [
    {"icon": Icons.shop, "label": "Shop"},
    {"icon": Icons.store, "label": "In-store"},
    {"icon": Icons.card_giftcard, "label": "Rewards"},
    {"icon": Icons.local_offer, "label": "Deals"},
    {"icon": Icons.bookmark, "label": "Saved"},
  ].obs;

  // 💰 Stats
  var stats = [
    {"value": "\$100", "label": "Purchase power"},
    {"value": "\$000.00", "label": "Nothing to pay"},
  ].obs;

  // 📦 Order Status
  var orderStatus = [
    {"icon": Icons.all_inbox, "label": "All orders"},
    {"icon": Icons.local_shipping, "label": "On its way"},
    {"icon": Icons.check_circle, "label": "Delivered"},
    {"icon": Icons.refresh, "label": "Returns"},
    {"icon": Icons.add_box, "label": "Add orders"},
  ].obs;

  // 🏷️ Top Brands
  var brands = [
    {
      "name": "Amazon",
      "logo":
          "https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg",
    },
    {
      "name": "Nike",
      "logo": "https://1000logos.net/wp-content/uploads/2017/03/Nike-Logo.png",
    },
    {
      "name": "Apple",
      "logo":
          "https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg",
    },
    {
      "name": "Puma",
      "logo": "https://1000logos.net/wp-content/uploads/2017/05/PUMA-logo.png",
    },
    {
      "name": "Adidas",
      "logo":
          "https://1000logos.net/wp-content/uploads/2017/03/Adidas-Logo.png",
    },
  ].obs;
}
