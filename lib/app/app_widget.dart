import 'package:flutter/material.dart';
import 'package:personal_finances/app/routes/routes.gr.dart';
import 'package:personal_finances/app/shared/style/app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      onGenerateRoute: Router.onGenerateRoute,
      navigatorKey: Router.navigatorKey,
      theme: AppTheme.light,
    );
  }
} 
