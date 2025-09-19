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
        color: Color(0xFF236A91),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Color(0xFF236A91)),
                  SizedBox(width: 8),
                  Text(
                    "Bottles",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  )
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rp 221.000",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _actionButton(Icons.arrow_upward, "Pay"),
                _actionButton(Icons.add_circle, "Top Up"),
                _actionButton(Icons.explore, "Explore")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white,),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white
          ),
        )
      ],
    );
  }
}