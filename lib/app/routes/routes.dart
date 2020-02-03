import 'package:auto_route/auto_route_annotations.dart';
import 'package:personal_finances/app/modules/home/pages/add_transaction_page.dart';
import 'package:personal_finances/app/modules/login/login_module.dart';
import 'package:personal_finances/app/modules/splash/splash_screen.dart';

import '../modules/home/home_module.dart';

//flutter pub run build_runner watch --delete-conflicting-outputs

@autoRouter
class $Router {
  SplashScreen splashScreen;
  
  @initial
  HomeModule homeModule;

  AddTransactionPage addTransactionPage;

  LoginModule loginModule;
}
