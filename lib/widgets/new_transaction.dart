import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  submitData() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = double.parse(amountController.text);
    
    if( enteredTitle.isEmpty || enteredAmount.isNegative){
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
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
