import 'package:flutter/material.dart';
import 'package:personal_finances/app/models/transaction_model.dart';

class ItemTransactionWidget extends StatelessWidget {
  final TransactionModel item;
  ItemTransactionWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(item.type),
          Text(item.value.toString()),
          Text(item.date.toString()),
        ],
      ),
    );
  }
}
