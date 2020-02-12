import 'package:flutter/material.dart';
import 'package:personal_finances/app/models/transaction_model.dart';
import 'package:personal_finances/app/modules/home/home_module.dart';

import '../home_bloc.dart';
import 'item_transacation_widget.dart';

class ListTransactionWidget extends StatelessWidget {
  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionModel>>(
      stream: _homeBloc.outItems,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 15),
            itemBuilder: (_, index) {
              return ItemTransactionWidget(item: snapshot.data[index]);
            },
            itemCount: snapshot.data.length,
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
