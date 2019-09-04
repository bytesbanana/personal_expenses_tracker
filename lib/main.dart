import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't12',
      title: 'Gucci belt',
      amount: 12000,
      date: DateTime.now(),
    ),
  ];

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter app'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Text('Chart'),
              ),
              elevation: 5,
            ),
          ),
          Card(
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
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
