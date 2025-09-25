import 'package:flutter/material.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/consts.dart';

class ProductTitle extends StatelessWidget {
  final ProductsModel product;

  const ProductTitle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    const double imageWidthRatio = 0.55; // Ukuran gambar diperkecil
    const double imageHeightRatio = 0.20; // Ukuran gambar diperkecil

    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        bottom: 50
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Products",
            style: TextStyle(
              color: textColor
            ),
          ),
          SizedBox(height: 5,),
          Text(
            product.title,
            style: TextStyle(
              color: textColor,
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      product.getFormattedPrice(),
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  width: size.width * imageWidthRatio,
                  height: size.height * imageHeightRatio,
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
