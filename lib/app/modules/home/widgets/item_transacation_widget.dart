import 'package:flutter/material.dart';
import 'package:personal_finances/app/models/transaction_model.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class ItemTransactionWidget extends StatelessWidget {
  final TransactionModel item;
  ItemTransactionWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: AppColors.turquoise,
            child: Icon(
              item.category.icon,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.category.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        item.description,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.ligthBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.lightBlue,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    item.valueInReal,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.turquoise,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
