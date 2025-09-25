import 'dart:async';

import 'package:flutter/material.dart';
import 'package:owala_app/utils/consts.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  // Daftar aset gambar banner.
  final List<String> _bannerAssets = const [
    "assets/images/banner_1.png",
    "assets/images/banner_2.png",
    "assets/images/banner_3.png",
    "assets/images/banner_4.png"
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        if (_currentPage < _bannerAssets.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 180),
      child: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: _bannerAssets
            .map((asset) => _BannerImage(asset: asset))
            .toList(),
      ),
    );
  }
}

class _BannerImage extends StatelessWidget {
  final String asset;

  const _BannerImage({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(asset, fit: BoxFit.cover),
      ),
    );
  }
}