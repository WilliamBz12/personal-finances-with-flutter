import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:personal_finances/app/modules/login/login_bloc.dart';
import 'package:personal_finances/app/modules/login/login_page.dart';
import 'package:personal_finances/app/shared/services/auth_service.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LoginBloc(authService: i.get())),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => AuthService()),
  ];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
