import 'package:flutter/material.dart';
import '../models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;

  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              //   return Card(
              //     child: Row(
              //       children: [
              //         Container(
              //           margin: EdgeInsets.symmetric(
              //             vertical: 10,
              //             horizontal: 15,
              //           ),
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //               color: Theme.of(context).primaryColor,
              //               width: 2,
              //             ),
              //           ),
              //           padding: EdgeInsets.all(10),
              //           child: Text(
              //             '\$${transactions[index].amount.toStringAsFixed(2)}',
              //             style: Theme.of(context).textTheme.headline6,
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               transactions[index].title,
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             Text(
              //               DateFormat.yMMMd().format(transactions[index].date),
              //               style: TextStyle(
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   );
              // },
              // In place of above custom widget designing we can use the below widget to make the transaction lists.
              return TransactionItem(transaction: transactions[index], deletetx: deletetx);
            },
            // leading refers to the object list at first postiton in the list.
            itemCount: transactions.length,
          );
  }
}


