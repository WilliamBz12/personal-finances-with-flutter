import 'package:personal_finances/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:personal_finances/app/app_widget.dart';
import 'package:personal_finances/app/shared/blocs/auth_bloc.dart';

import 'shared/services/auth_service.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
        Bloc((i) => AuthBloc(authService: i.get())),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => AuthService()),
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
