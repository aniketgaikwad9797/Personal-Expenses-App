import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTx;

  NewTransaction(this.newTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitInfo() {
    final enteredText = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty || enteredAmount < 0) return;

    widget.newTx(
      enteredText,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              onSubmitted: (_) => submitInfo(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitInfo(),
              // onChanged: (amountValue) => amountinput = amountValue,
              controller: amountController,
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  Text("No date Choosen!"),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: submitInfo,
              child: Text(
                "Add Transaction",
                //style:
                //TextStyle(color: Theme.of(context).textTheme.button.color),
              ),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
