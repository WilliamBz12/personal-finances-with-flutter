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
          final _list = snapshot.data;
          return ListView.builder(
            itemCount: _list.length,
            itemBuilder: (_, index) =>
                ItemTransactionWidget(item: _list[index]),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
