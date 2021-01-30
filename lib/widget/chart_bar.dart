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
        Text(
          spedingAmount.toStringAsFixed(0)+"rs",
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 40,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor:
                    spendingAmountasPCT, //height factor should be between 0 and 1
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(day),
      ],
    );
  }
}
