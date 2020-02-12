import 'package:flutter/material.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../home_bloc.dart';
import '../home_module.dart';

class HeadBalanceWidget extends StatelessWidget {
  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          StreamBuilder<double>(
            stream: _homeBloc.outSpeend,
            builder: (_, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  snapshot.hasData
                      ? _buildTitle(value: snapshot.data)
                      : Shimmer.fromColors(
                          child: _buildTitle(value: 00),
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                        ),
                  Text(
                    "Saldo total",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              );
            },
          ),
          Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  image: DecorationImage(
                      fit: BoxFit.fill,

                      image: NetworkImage("https://i.imgur.com/BoN9kdC.png")))),
        ],
      ),
    );
  }

  Widget _buildTitle({double value}) {
    return Text(
      "R\$ ${value.toStringAsFixed(2).replaceAll(".", ",")}",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 28,
      ),
    );
  }
}
