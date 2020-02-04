import 'package:dartz/dartz.dart';
import 'package:personal_finances/app/modules/home/repositories/transaction_repository.dart';
import 'package:personal_finances/app/models/transaction_model.dart';

class HomeService {
  TransactionRepository transactionRepository;
  HomeService({this.transactionRepository});

  Future<Either<String, Stream<List<TransactionModel>>>>
      fetchAllTransaction() async {
    try {
      final response = await transactionRepository.fetchAll();
      return Right(response);
    } on Exception {
      return Left("Não funcionou");
    }
  }

  Either<String, bool> addNewTransaction({TransactionModel item}) {
    try {
      transactionRepository.addNew(item: item);
      return Right(true);
    } on Exception {
      return Left("Não funcionou");
    }
  }

  Either<String, bool> deleteTransaction({String id}) {
    try {
      transactionRepository.delete(id: id);
      return Right(true);
    } on Exception {
      return Left("Não funcionou");
    }
  }
}
