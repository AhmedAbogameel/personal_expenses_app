import 'package:flutter/material.dart';
import 'package:personalexpensesapp/transaction.dart';
import 'package:personalexpensesapp/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions, this.deleteTx);
  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'images/sleeping.png',
                        fit: BoxFit.cover,
                        color: Theme.of(context).primaryColor,
                      )),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  deleteTx: deleteTx,
              );
            },
          );
  }
}
