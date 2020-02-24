import 'package:flutter/material.dart';
import 'package:personal_finances/app/app_module.dart';
import 'package:personal_finances/app/shared/blocs/auth_bloc.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authBloc = AppModule.to.getBloc<AuthBloc>();
  @override
  void initState() {
    super.initState();
    _authBloc.verifyStatus();
    Future.delayed(Duration(seconds: 2)).then((_) => _onCheck());
  }

  void _onCheck() {
    _authBloc.outAuthStatus.listen((authStatus) {
      switch (authStatus) {
        case AuthStatus.LOGGED_IN:
          Navigator.pushReplacementNamed(context, '/home-module');
          break;
        case AuthStatus.NOT_LOGGED_IN:
          Navigator.pushReplacementNamed(context, '/login-module');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Finances APP",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
