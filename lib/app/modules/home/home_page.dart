import 'package:flutter/material.dart';
import 'package:personal_finances/app/app_module.dart';
import 'package:personal_finances/app/modules/home/home_module.dart';
import 'package:personal_finances/app/modules/home/pages/add_transaction_page.dart';
import 'package:personal_finances/app/modules/home/widgets/head_balance_widget.dart';
import 'package:personal_finances/app/modules/home/widgets/list_transactions_widgets.dart';
import 'package:personal_finances/app/shared/blocs/auth_bloc.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();
  final _authBloc = AppModule.to.getBloc<AuthBloc>();

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
      bottomNavigationBar: _buildBottomNavigatorBar(),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HeadBalanceWidget(),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: ListTransactionWidget(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTransacation,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBottomNavigatorBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4,
      child: Container(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.graphic_eq),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_balance_wallet),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
