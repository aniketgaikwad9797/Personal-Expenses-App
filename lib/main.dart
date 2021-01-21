import 'package:PersonalExpenses/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
/*Adding comments here*/
class MyHomePage extends StatelessWidget {
  //var formattedDate = DateFormat.yMd();
  //String titleInput;
  //String amountinput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final List<Transaction> transactions = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text(
                "The main chart",
              ),
              elevation: 10,
              color: Colors.amberAccent,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    //  onChanged: (titleValue) {
                    //   titleInput = titleValue;
                    //   },
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                    // onChanged: (amountValue) => amountinput = amountValue,
                    controller: amountController,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("Add Transaction"),
                    textColor: Colors.deepPurpleAccent,
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
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
                          color: Colors.purple,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Rs: ${tx.amount}", //String Interpolation
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            tx.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            DateFormat.yMMMd().format(tx.date),
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
            }).toList(), //map() method is used to convert list of objects into list of widgets
            //toList() is used bcoz map() function will always give us a iterable
            //which we need to iterate
            //also map() takes a function which gets automatically executed
          ),
        ],
      ),
    );
  }
}
