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
            FlatButton(
                child: Text(
                  'Add transaction',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                textColor: Colors.purple,
                onPressed: submitData),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
