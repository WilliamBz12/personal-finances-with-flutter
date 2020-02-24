import 'package:flutter/material.dart';
import 'package:personal_finances/app/modules/home/home_module.dart';
import 'package:personal_finances/app/modules/home/pages/add_transaction_page.dart';
import 'package:personal_finances/app/modules/home/widgets/head_balance_widget.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

import 'home_bloc.dart';
import 'pages/list_transactions_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();

  void _addNewTransacation() {
    showDialog(
      context: context,
      builder: (context) {
        return SafeArea(
          child: AddTransactionPage(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _homeBloc.loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HeadBalanceWidget(),
            Expanded(child: ListTransactionsPage()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTransacation,
        child: Icon(Icons.add),
      ),
    );
  }
}
