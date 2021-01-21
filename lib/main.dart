import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import 'package:flutter/material.dart';



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
          NewTransaction(),
          TransactionList(),
        ],
      ),
    );
  }
}
