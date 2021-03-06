import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
      height: 300,
      width: double.infinity,
      child: transactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No transactions added yet!!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 6,
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.purpleAccent),
                      height: 60,
                      width: 60,
                      //foregroundColor: Colors.black,
                      child: FittedBox(
                        child: Text(
                          "Rs: " +
                              transactions[index].amount.toStringAsFixed(0),
                          style: TextStyle(color: Colors.indigoAccent),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        color: Theme.of(context).errorColor,
                        //color: errorColor,
                        onPressed: () {
                          deleteTransaction(transactions[index].id);
                        }),
                  ),
                );
                /*Card(
                  elevation: 6,
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
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
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
                );*/
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
