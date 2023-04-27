import 'package:flutter/material.dart';

class Product {
  final String image, name;
  final String location;
  final Color bgColor;

  Product({
    required this.image,
    required this.name,
    required this.location,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [
  Product(
    image: "assets/images/chinese.jpg",
    name: "Long Raynek 23-34-8u East London",
    location: "16.5 km",
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/images/dessert.jpg",
    name: "Pasyray 83-44-8u West London",
    location: "5 km",
  ),
  Product(
    image: "assets/images/indian.jpg",
    name: "Murved 63-77-9u North london",
    location: "1.5 km",
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/images/sandwiches.jpg",
    name: "Casual Nolin 93-56-06 South London",
    location: "6.5 km",
    bgColor: const Color(0xFFEEEEED),
  ),
];

