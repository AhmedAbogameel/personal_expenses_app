import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar(this.label,this.spendingAmount,this.spendingPctOfTotal);

  final String label;
  final double spendingAmount;
  final spendingPctOfTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(height:20,child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  border: Border.all(color: Colors.grey,width: 1.0)
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
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
        SizedBox(height: 4,),
        Text(label),
      ],
    );
  }
}
