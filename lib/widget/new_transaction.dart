import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTx;

  NewTransaction(this.newTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;

  void submitInfo() {
    final enteredText = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty || enteredAmount < 0 || selectedDate == null)
      return;

    widget.newTx(
      enteredText,
      enteredAmount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null)
        return;
      else {
        selectedDate = pickedDate;
        print("Selected Date: " + DateFormat.yMd().format(selectedDate));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  Expanded(
                    child: Text(selectedDate == null
                        ? "No date Choosen!"
                        : "Picked Date: ${DateFormat.yMd().format(selectedDate)}"),
                  ),
                  FlatButton(
                    onPressed: _presentDatePicker,
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
