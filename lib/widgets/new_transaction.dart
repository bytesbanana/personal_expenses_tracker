import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
              // onChanged: (value){
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
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
              onPressed: () {
                // TODO: Add new transaction
                print(titleController.text);
                print(amountController.text);
              },
            ),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
