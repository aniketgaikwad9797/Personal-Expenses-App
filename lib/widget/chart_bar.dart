import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double spedingAmount;
  final double spendingAmountasPCT;
  ChartBar(this.day, this.spedingAmount, this.spendingAmountasPCT);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 20,
          width: 5,
          child: null,
        ),
        Text(day),
      ],
    );
  }
}
