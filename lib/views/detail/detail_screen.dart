import 'package:flutter/material.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/views/detail/components/add_to_cart.dart';
import 'package:owala_app/views/detail/components/description.dart';
import 'package:owala_app/views/detail/components/fav_button.dart';
import 'package:owala_app/views/detail/components/product_title.dart';

class DetailScreen extends StatelessWidget {
  final ProductsModel product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: textColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: textColor),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ProductTitle(product: product),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 50,
                left: 25,
                right: defaultPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Description(product: product),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FavButton(product: product)
                    ],
                  ),
                  SizedBox(height: 20),
                  AddToCart(product: product, quantity: quantity),
                  SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}