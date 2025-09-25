import 'package:flutter/material.dart';
import 'package:owala_app/utils/consts.dart';

class Categories extends StatefulWidget {
  final Function(String) onCategorySelected;

  const Categories({super.key, required this.onCategorySelected});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String _selectedCategory = 'All';

  // Daftar kategori yang akan ditampilkan
  final List<Map<String, dynamic>> _categories = const [
    {'name': 'All', 'icon': Icons.grid_view},
    {'name': 'Cakes', 'icon': Icons.cake},
    {'name': 'Pastries', 'icon': Icons.bakery_dining},
    {'name': 'Catering', 'icon': Icons.local_dining},
    {'name': 'Drinks', 'icon': Icons.local_cafe},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul kategori
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        const SizedBox(height: 15),
        // Daftar kategori yang bisa digulir
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: defaultPadding),
              ..._categories.map((category) {
                final isSelected = _selectedCategory == category['name'];
                return GestureDetector(
                  onTap: () {
                    // Perbarui kategori yang dipilih saat widget diketuk
                    setState(() {
                      _selectedCategory = category['name'] as String;
                    });
                    // Panggil fungsi callback untuk memberi tahu widget induk
                    widget.onCategorySelected(_selectedCategory);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        // Lingkaran ikon kategori dengan border kondisional
                        Container(
                          width: 56, // Diameter CircleAvatar (2 * radius)
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ? Colors.black : Colors.white,
                            border: isSelected 
                                ? null 
                                : Border.all(color: Colors.black, width: 2),
                          ),
                          child: Icon(
                            category['icon'] as IconData,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Nama kategori
                        Text(
                          category['name'] as String,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.black : textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(width: defaultPadding),
            ],
          ),
        ),
      ],
    );
  }
}
