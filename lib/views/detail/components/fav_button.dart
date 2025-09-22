import 'package:flutter/material.dart';
import 'package:owala_app/models/products_model.dart';

class FavButton extends StatelessWidget {
  final ProductsModel product;

  const FavButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isfavorite;

    return IconButton(
      onPressed: () {
        if (isfavorite = true) {
          
        } else {
          
        }
      },
      icon: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
    );
  }
}