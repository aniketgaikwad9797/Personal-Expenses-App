import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.newTx);

  void submitInfo() {
    titleController.text;
    double.parse(amountController.text);
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
              onSubmitted: (_) => submitInfo,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitInfo,
              // onChanged: (amountValue) => amountinput = amountValue,
              controller: amountController,
            ),
            FlatButton(
              onPressed: submitInfo,
              child: Text("Add Transaction"),
              textColor: Colors.deepPurpleAccent,
            )
          ],
        ),
      ),
    );
  }
}
