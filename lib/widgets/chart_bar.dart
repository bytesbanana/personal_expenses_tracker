import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, boxConstraints) {
      return Column(
        children: <Widget>[
          Container(
            height: boxConstraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: boxConstraints.maxHeight * 0.05,
          ),
          Container(
            height: boxConstraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
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
          SizedBox(
            height: boxConstraints.maxHeight * 0.05,
          ),
          Container(
            height: boxConstraints.maxHeight * 0.15,
            child: FittedBox(
              child: isToday(label)
                  ? Text(
                      label,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : Text(label),
            ),
          ),
        ],
      );
    });
  }

  bool isToday(String day) {
    if (day ==
        DateFormat.E().format(DateTime.now()).toString().substring(0, 1)) {
      return true;
    }
    return false;
  }
}
