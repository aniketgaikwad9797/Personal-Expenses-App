import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "1",
      name: "Clothes",
      amount: 1200,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      name: "Shoes",
      amount: 1400,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      name: transactionTitle,
      amount: transactionAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
