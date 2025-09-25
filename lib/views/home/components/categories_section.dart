import 'package:flutter/material.dart';
import 'package:owala_app/utils/consts.dart';

class CategoriesSection extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String selectedCategory;

  const CategoriesSection({
    super.key,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    // Daftar kategori yang akan ditampilkan
    final List<Map<String, dynamic>> categories = [
      {'name': 'All', 'icon': Icons.list},
      {'name': 'Cakes', 'icon': Icons.cake},
      {'name': 'Pastries', 'icon': Icons.bakery_dining},
      {'name': 'Catering', 'icon': Icons.local_dining},
      {'name': 'Drinks', 'icon': Icons.local_cafe},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories.map((category) {
          final isSelected = selectedCategory == category['name'];
          return GestureDetector(
            onTap: () => onCategorySelected(category['name']),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: isSelected ? primaryColor : Colors.grey.shade200,
                  child: Icon(
                    category['icon'] as IconData,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category['name'] as String,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? primaryColor : Colors.black,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
