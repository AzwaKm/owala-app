import 'package:flutter/material.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/consts.dart';

class ProductTitle extends StatelessWidget {
  final ProductsModel product;

  const ProductTitle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    const double imageWidthRatio = 0.58; // ini akan mengambil 35% dari lebar layar
    const double imageHeightRatio = 0.36; // ini akan mengambil 20% dari tinggi layar

    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        bottom: 50
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Drinkware",
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
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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