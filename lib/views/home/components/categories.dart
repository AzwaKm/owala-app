import 'package:flutter/material.dart';
import 'package:owala_app/utils/consts.dart';

class Categories extends StatefulWidget {

  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}
List<Map<String, dynamic>> categories = [
  {
    "icon": Icons.local_drink,
    "text": "Drinkware",
  },
  {
    "icon": Icons.color_lens,
    "text": "Colordrop",
  },
  {
    "icon": Icons.card_giftcard,
    "text": "Bundles",
  },
  {
    "icon": Icons.accessibility,
    "text": "Accessories",
  },
];

int selectedIndex = 0;


class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
          children: [
             Text(
            "Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "View All",
              style: TextStyle(
                color: Color(0xFF236A91),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          ],
         ),
         SizedBox(height: defaultPadding),
         SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => _buildCategory(index),
          ),
         )
        ],
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10), //kurangi padding agar icon lebih kecil
              decoration: BoxDecoration(
                color: selectedIndex == index ? primaryColor : Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                categories[index] ["icon"],
                color: selectedIndex == index ? primaryColor : secondaryColor,
                size: 20,
              ),
            ),
            SizedBox(height: 7),
            Text(
              categories[index] ["text"],
              style: TextStyle(
                color: selectedIndex == index ? primaryColor : secondaryColor,
                fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}