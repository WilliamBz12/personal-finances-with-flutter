// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:personal_finances/app/modules/splash/splash_screen.dart';
import 'package:personal_finances/app/modules/home/home_module.dart';
import 'package:personal_finances/app/modules/home/pages/add_transaction_page.dart';
import 'package:personal_finances/app/modules/login/login_module.dart';

class Router {
  static const splashScreen = '/splash-screen';
  static const homeModule = '/';
  static const addTransactionPage = '/add-transaction-page';
  static const loginModule = '/login-module';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case Router.homeModule:
        return MaterialPageRoute(
          builder: (_) => HomeModule(),
          settings: settings,
        );
      case Router.addTransactionPage:
        return MaterialPageRoute(
          builder: (_) => AddTransactionPage(),
          settings: settings,
        );
      case Router.loginModule:
        return MaterialPageRoute(
          builder: (_) => LoginModule(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
