import 'package:flutter/material.dart';
import './user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function newTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.newTx);
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
    );
  }
}
