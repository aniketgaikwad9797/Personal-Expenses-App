import 'package:PersonalExpenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: 
      ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Rs: ${transactions[index].amount.toStringAsFixed(2)}", //String Interpolation
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        transactions[index].name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Container(
                      child: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
        //children: transactions.map((tx) {
        // return ).toList(), //map() method is used to convert list of objects into list of widgets
        //toList() is used bcoz map() function will always give us a iterable
        //which we need to iterate
        //also map() takes a function which gets automatically executed
      ),
    );
  }
}
