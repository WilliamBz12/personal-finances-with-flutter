import 'package:auto_route/auto_route_annotations.dart';
import 'package:personal_finances/app/modules/home/pages/add_transaction_page.dart';

import '../modules/home/home_module.dart';

@autoRouter
class $Router {
  @initial
  HomeModule homeModule;

  AddTransactionPage addTransactionPage;
  
  
}
