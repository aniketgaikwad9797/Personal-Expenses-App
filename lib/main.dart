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
          Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
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
        ],
      ),
    );
  }
}
