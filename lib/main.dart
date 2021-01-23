import 'package:PersonalExpenses/widget/transaction_list.dart';

import './widget/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          "Personal Expenses", //this is the title that appears when app is in background
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //ThemeData is not a widget but a class provided by flutter
        primarySwatch:
            Colors.orange, //alternate is primaryColor but only one shade
        accentColor: Colors.cyanAccent,
        fontFamily: 'BodoniModa',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'BodoniModa',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
        ),
      ),
    );
  }
}

/*Adding comments here*/
class MyHomePage extends StatefulWidget {
  //var formattedDate = DateFormat.yMd();
  //String titleInput;
  //String amountinput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //floating action button takes accentColor by default otherwise primaryColor
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => startAddNewTransaction(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
