import 'package:flutter/material.dart';
import 'package:personalexpensesapp/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personalexpensesapp/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  Chart(this.recentTransactions);

  final List<Transaction> recentTransactions;

  List<Map<String,Object>> get groupedTransactionValues{
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for(int i = 0; i < recentTransactions.length; i++){
        if(
            recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year
        ){
          totalSum =totalSum+ recentTransactions[i].amount;
        }
      }

      return {
        'day' : DateFormat.E().format(weekDay).substring(0,1),
        'amount' : totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending{
    return groupedTransactionValues.fold(0.0, (sum,item){
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data){
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending == 0.0 ? 0.0 :  (data['amount'] as double) / totalSpending
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
