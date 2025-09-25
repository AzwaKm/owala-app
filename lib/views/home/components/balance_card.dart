import 'package:flutter/material.dart';
import 'package:owala_app/utils/consts.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white, // Mengubah warna latar belakang menjadi putih
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black, // Menambahkan border hitam
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          Text(
            "Welcome,\nAzwa Khalisa!",
            style: TextStyle(
              color: Colors.black, // Mengubah warna teks menjadi hitam
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}