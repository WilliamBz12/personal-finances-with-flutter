import 'package:flutter/material.dart';
import 'package:personal_finances/app/modules/home/widgets/filter_widget.dart';
import 'package:personal_finances/app/modules/home/widgets/list_transactions_widgets.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class ListTransactionsPage extends StatefulWidget {
  @override
  _ListTransactionsPageState createState() => _ListTransactionsPageState();
}

class _ListTransactionsPageState extends State<ListTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40),
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            "Transações Recentes",
            style: TextStyle(
              color: Color(0xFF173A61),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: FilterWidget(),
          ),
          Expanded(
            child: ListTransactionWidget(),
          ),
        ],
      ),
    );
  }
}
