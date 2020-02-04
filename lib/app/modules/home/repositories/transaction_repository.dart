import 'package:personal_finances/app/core/firestore_client_provider.dart';
import 'package:personal_finances/app/models/transaction_model.dart';
import 'package:meta/meta.dart';

class TransactionRepository {
  //Reference in database firebase
  final FirestoreClientProvider firestoreClientProvider;
  TransactionRepository({@required this.firestoreClientProvider});

  Future<Stream<List<TransactionModel>>> fetchAll() async {
    final _collection =
        await firestoreClientProvider.collectionReference('transactions');
    final _snapshot = _collection.orderBy('date').snapshots();
    return _snapshot.map((data) {
      return data.documents
          .map((item) => TransactionModel.fromMap(document: item))
          .toList();
    });
  }

  void delete({String id}) async {
    final _collection =
        await firestoreClientProvider.collectionReference('transactions');
    _collection.document(id).delete();
  }

  void addNew({TransactionModel item}) async {
    final _collection =
        await firestoreClientProvider.collectionReference('transactions');
    _collection.add(item.toMap());
  }

  void update({TransactionModel item}) async {
    final _collection =
        await firestoreClientProvider.collectionReference('transactions');
    _collection.document(item.id).updateData(item.toMap());
  }
}
