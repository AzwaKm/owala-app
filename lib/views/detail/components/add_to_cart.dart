import 'package:flutter/material.dart';
import 'package:owala_app/data/products_data.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/consts.dart';

class AddToCart extends StatelessWidget {
  final ProductsModel product;
  final int quantity;

  const AddToCart({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black, width: 2) // Mengubah ketebalan border menjadi 2
            ),
            child: IconButton(
              icon: Icon(Icons.add_shopping_cart_outlined, color: Colors.black),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                    Text("Successfully Added ${product.title}"),
                    duration: Duration(seconds: 2),
                  )
                );
              },
            ),
          ),
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.black, width: 2), // Mengubah ketebalan border menjadi 2
                maximumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)
                )
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                    Text("${product.title} is purchased"),
                    duration: Duration(seconds: 2)
                  )
                );
              },
              child: Text(
                "BUY NOW",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}