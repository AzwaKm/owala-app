import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductsModel {
  final int id, price, size;
  final String image, title, description, category;
  final Color color;

  ProductsModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.color,
    required this.category,
  });

  String getFormattedPrice() {
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 2);
    return formatter.format(price);
  }
}
