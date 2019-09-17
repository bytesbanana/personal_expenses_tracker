import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  submitData() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount.isNegative) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    // Destroy NewTranscation when submit
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData,
              // Can use Controller OR onChanged
              // onChanged: (value){
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,

              // Can use Controller OR onChanged
              // onChanged: (value){
              //   amountInput = value;
              // },
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No date chosen!'),
                  FlatButton(
                    child: Text(
                      'Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            RaisedButton(
                child: Text(
                  'Add transaction',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: submitData),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
