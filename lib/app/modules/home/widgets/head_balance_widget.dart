import 'package:flutter/material.dart';
import 'package:personal_finances/app/app_module.dart';
import 'package:personal_finances/app/modules/home/typography/home_typography.dart';
import 'package:personal_finances/app/shared/blocs/auth_bloc.dart';
import 'package:personal_finances/app/shared/utils/cash_to_string.dart';
import 'package:shimmer/shimmer.dart';

import '../home_bloc.dart';
import '../home_module.dart';

class HeadBalanceWidget extends StatelessWidget {
  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();
  final _authBloc = AppModule.to.getBloc<AuthBloc>();

  void _onTapSingOut(context) {
    _authBloc.singOut();
    Navigator.popAndPushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildBalance(),
          Row(
            children: <Widget>[
              _buildUser(),
              SizedBox(width: 10),
              _buildSingoutButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalance() {
    return StreamBuilder<double>(
      stream: _homeBloc.outBalance,
      builder: (_, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            snapshot.hasData
                ? _buildTitle(value: snapshot.data)
                : Shimmer.fromColors(
                    child: _buildTitle(value: 0),
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                  ),
            Text("Saldo total", style: HomeTypography.subTitleHead),
          ],
        );
      },
    );
  }

  Widget _buildSingoutButton(context) {
    return InkWell(
      onTap: () => _onTapSingOut(context),
      child: Icon(Icons.exit_to_app, color: Colors.white),
    );
  }

  Widget _buildUser() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
        ),
      ),
    );
  }

  Widget _buildTitle({double value}) {
    return Text(
      CashToString.convertInReais(value: value),
      style: HomeTypography.titleHead,
    );
  }
}
