import 'package:personal_finances/app/modules/home/home_service.dart';
import 'package:personal_finances/app/modules/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:personal_finances/app/modules/home/home_page.dart';
import 'package:personal_finances/app/modules/home/repositories/transaction_repository.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(homeService: i.get())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => TransactionRepository()),
        Dependency((i) => HomeService(transactionRepository: i.get())),
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
