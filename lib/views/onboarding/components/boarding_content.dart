import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/utils/size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.text, required this.image});

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: getProporsionateScreenHeight(300), 
            width: getProporsionateScreenWidth(300),
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Black Star Pastry",
            style: TextStyle(
              color: primaryColor,
              fontSize: getProporsionateScreenWidth(36),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 15),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}