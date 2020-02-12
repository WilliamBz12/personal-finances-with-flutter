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
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          StreamBuilder<double>(
            stream: _homeBloc.outSpeend,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Text(
                      "R\$ ${snapshot.data.toStringAsFixed(2).replaceAll(".", ",")}",
                      style: TextStyle(
                        color: AppColors.darkBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "Saldo total",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.ligthBlack,
                      ),
                    ),
                  ],
                );
              }
              return Shimmer.fromColors(
                child: SizedBox(height: 30, width: 200),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
              );
            },
          ),
        ],
      ),
    );
  }
}
