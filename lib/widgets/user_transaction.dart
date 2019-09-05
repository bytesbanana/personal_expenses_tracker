import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/models/transaction.dart';

import 'new_transaction.dart';
import 'transactoin_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't12',
      title: 'Gucci belt',
      amount: 12000,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newIx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newIx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactonList(_userTransactions),
      ],
    );
  }
}
