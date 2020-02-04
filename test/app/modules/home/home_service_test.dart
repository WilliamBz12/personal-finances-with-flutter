import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:personal_finances/app/modules/home/home_service.dart';
import 'package:personal_finances/app/modules/home/repositories/transaction_repository.dart';
import 'package:personal_finances/app/models/transaction_model.dart';

class MockTrasactionRepository extends Mock implements TransactionRepository {}

void main() {
  HomeService service;
  MockTrasactionRepository mockTrasactionRepository;

  setUp(() {
    mockTrasactionRepository = MockTrasactionRepository();
    service = HomeService(transactionRepository: mockTrasactionRepository);
  });

  group('HomeService Test', () {
    List<TransactionModel> _transactions = [
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
      expect(service, isInstanceOf<HomeService>());
    });

    test("Should returns Left Side when repository throwns Exception",
        () async {
      when(mockTrasactionRepository.fetchAll()).thenThrow(Exception());
      final result = await service.fetchAllTransaction();
      expect(result, equals(Left("Não funcionou")));
    });

    test(
      "Should returns all items in Right Side when repository return a Stream list",
      () async {
        when(mockTrasactionRepository.fetchAll())
            .thenAnswer((_) async => Stream.value(_transactions));
        final result = await service.fetchAllTransaction();

        result.fold(
          (error) => expect(error, isNull),
          (list) async {
            expect(list, isInstanceOf<Stream<List<TransactionModel>>>());
            final items = await list.first;
            expect(items.length, 2);
            expect(items[0].type, "Breakfast");
            expect(items[0].value, 14);
          },
        );
      },
    );

    test("Should returns Left Side when add new trasaction throwns Exception",
        () {
      when(mockTrasactionRepository.addNew()).thenThrow(Exception());
      final result = service.addNewTransaction();
      expect(result, equals(Left("Não funcionou")));
    });

    test("Should returns Right Side when add new trasaction", () {
      when(mockTrasactionRepository.addNew()).thenAnswer((_) => true);
      final result = service.addNewTransaction(item: _transactions[0]);
      expect(result, equals(Right(true)));
    });

    test("Should returns Left Side when delete a transaction", () {
      when(mockTrasactionRepository.delete()).thenThrow(Exception());
      final result = service.deleteTransaction();
      expect(result, equals(Left("Não funcionou")));
    });

    test("Should returns Right Side when delete a transaction", () {
      when(mockTrasactionRepository.delete()).thenAnswer((_) => true);
      final result = service.deleteTransaction(id: "1");
      expect(result, equals(Right(true)));
    });
  });
}
