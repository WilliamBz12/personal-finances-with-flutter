import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:personal_finances/app/modules/home/home_service.dart';
import 'package:personal_finances/app/models/transaction_model.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends BlocBase {
  HomeService homeService;
  HomeBloc({this.homeService});

  final _itemsController = BehaviorSubject<List<TransactionModel>>();
  Stream<List<TransactionModel>> get outItems => _itemsController.stream;
  //.map((list) => list.where((item) => item.type == "alimentacao").toList());
  Stream<double> get outSpeend => _itemsController.stream.map(sumSpeend);

  double sumSpeend(List<TransactionModel> list) {
    final values = list.map((item) => item.value).toList();
    return values.reduce((first, second) => first + second);
  }

  void loadTransactions() async {
    final _items = await homeService.fetchAllTransaction();
    _items.fold(
      (error) => _itemsController.addError(error),
      (list) => _itemsController.addStream(list),
    );
  }

  bool addNewTransaction({TransactionModel item}) {
    final response = homeService.addNewTransaction(item: item);
    return response.isRight();
  }

  bool deleteTransaction({@required String id}) {
    final response = homeService.deleteTransaction(id: id);
    return response.isRight();
  }

  @override
  void dispose() {
    super.dispose();
    _itemsController.close();
  }
}
