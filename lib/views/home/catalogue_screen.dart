import 'package:flutter/material.dart';
import 'package:owala_app/views/home/components/app_bar.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _widgetOptions = [
    // TODO: menampilkan list dari widget yang akan ditampilkan di bottom navbar
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? CatalogueAppBar() : null,
    );
  }
}