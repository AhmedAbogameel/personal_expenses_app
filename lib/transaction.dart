import 'package:flutter/foundation.dart';

class Transaction {
  Transaction({this.amount, this.date, this.id, this.title});
  @required final String id;
  @required final String title;
  @required final double amount;
  @required final DateTime date;
}
