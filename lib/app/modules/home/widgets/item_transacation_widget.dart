import 'package:flutter/material.dart';
import 'package:personal_finances/app/models/transaction_model.dart';
import 'package:personal_finances/app/modules/home/typography/home_typography.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          _buildIcon(),
          SizedBox(width: 20),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildTitle(),
                    _buildDescription(),
                  ],
                ),
                _buildValue(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return CircleAvatar(
      backgroundColor: item.category.color,
      child: Icon(
        item.category.icon,
        color: Colors.white,
      ),
    );
  }

  Widget _buildValue() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        item.valueInReal,
        style: HomeTypography.titleItem(color: item.category.color),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      item.category.title,
      style: HomeTypography.titleItem(color: item.category.color),
    );
  }

  Widget _buildDescription() {
    return Container(
      width: 100,
      child: Text(
        item.description,
        softWrap: true,
        style: HomeTypography.descriptionItem(
          speend: item.category.isSpeend,
        ),
      ),
    );
  }
}
