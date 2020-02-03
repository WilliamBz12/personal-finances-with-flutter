import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:mockito/mockito.dart';

import 'package:personal_finances/app/modules/home/home_bloc.dart';
import 'package:personal_finances/app/modules/home/home_module.dart';
import 'package:personal_finances/app/modules/home/home_service.dart';
import 'package:personal_finances/app/models/transaction_model.dart';

class MockHomeService extends Mock implements HomeService {}

void main() {
  initModule(HomeModule());
  HomeBloc bloc;
  MockHomeService mockHomeService;

  setUp(() {
    mockHomeService = MockHomeService();
    bloc = HomeBloc(homeService: mockHomeService);
  });

  group('HomeBloc Test', () {
    String _error = "Não funcionou";
    List<TransactionModel> _list = [
      TransactionModel(
        type: "Breakfast",
        value: 14,
      ),
      TransactionModel(
        type: "Food",
        value: 17,
      ),
    ];

    test("First Test", () {
      expect(bloc, isInstanceOf<HomeBloc>());
    });

    test(
      "Should emits error when service return Left Side error",
      () async {
        when(mockHomeService.fetchAllTransaction())
            .thenAnswer((_) async => Left(_error));
        bloc.loadTransactions();
        expect(bloc.outItems, emitsError(_error));
      },
    );

    test(
      "Should emits stream list when service return Right Side",
      () async {
        when(mockHomeService.fetchAllTransaction())
            .thenAnswer((_) async => Right(Stream.value(_list)));
        bloc.loadTransactions();
        expect(await bloc.outItems.first, _list);
        final items = await bloc.outItems.first;
        expect(items[0].type, "Breakfast");
        expect(items[0].value, 14);
      },
    );

    test("Should returns false when add new trasaction throwns Exception", () {
      when(mockHomeService.addNewTransaction()).thenAnswer((_) => Left(_error));
      final result = bloc.addNewTransaction();
      expect(result, false);
    });

    test("Should returns true when add new trasaction", () {
      when(mockHomeService.addNewTransaction()).thenAnswer((_) => Right(true));
      final result = bloc.addNewTransaction();
      expect(result, true);
    });

    test("Should returns true when delete a trasaction", () {
      when(mockHomeService.deleteTransaction(id: "1"))
          .thenAnswer((_) => Right(true));
      final result = bloc.deleteTransaction(id: "1");
      expect(result, true);
    });

    test("Should returns false when delete a trasaction", () {
      when(mockHomeService.deleteTransaction(id: "1")).thenAnswer((_) => Left(_error));
      final result = bloc.deleteTransaction(id: "1");
      expect(result, false);
    });
  });
}
