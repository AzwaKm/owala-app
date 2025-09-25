import 'package:flutter/material.dart';
import 'package:owala_app/data/products_data.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/views/home/components/items_card.dart';
import 'package:owala_app/views/detail/detail_screen.dart'; // Import DetailScreen

class DrinkwareGrid extends StatelessWidget {
  const DrinkwareGrid({super.key, required this.selectedCategory});

  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    // Filter produk berdasarkan kategori yang dipilih
    final filteredProducts = selectedCategory == 'All'
        ? products
        : products
            .where((product) => product.category == selectedCategory)
            .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: defaultPadding,
          crossAxisSpacing: defaultPadding,
          childAspectRatio: 0.75,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) => ItemsCard(
          product: filteredProducts[index],
          press: () => Navigator.pushNamed(
            context,
            '/detail',
            arguments: filteredProducts[index],
          ),
        ),
      ),
    );
  }
}
