import 'package:flutter/material.dart';
import 'package:personal_finances/app/app_module.dart';
import 'package:personal_finances/app/modules/home/home_module.dart';
import 'package:personal_finances/app/modules/home/widgets/item_transacation_widget.dart';
import 'package:personal_finances/app/models/transaction_model.dart';
import 'package:personal_finances/app/shared/blocs/auth_bloc.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();
  final _authBloc = AppModule.to.getBloc<AuthBloc>();

  @override
  void initState() {
    super.initState();
    _homeBloc.loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder<List<TransactionModel>>(
          stream: _homeBloc.outItems,
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(snapshot.data.length, (index) {
                  return ItemTransactionWidget(item: snapshot.data[index]);
                }),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'add-transaction-page'),
        child: Icon(Icons.add),
      ),
    );
  }
}
