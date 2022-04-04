import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                  padding: const EdgeInsets.all(6),
                  child:
                      FittedBox(child: Text('\$${transaction[index].amount}'))),
            ),
            title: Text(
              transaction[index].title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              DateFormat.yMMMMd().format(transaction[index].date),
            ),
            trailing: MediaQuery.of(context).size.width > 400
                ? FlatButton.icon(
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                    textColor: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(transaction[index].id),
                  )
                : IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(transaction[index].id),
                  ),
          ),
        );
      },
      itemCount: transaction.length,
    );
  }
}
