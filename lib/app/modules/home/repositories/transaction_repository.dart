import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_finances/app/models/transaction_model.dart';

class TransactionRepository {
  //Reference in database firebase
  final _collection = Firestore.instance.collection('statements');

  Stream<List<TransactionModel>> fetchAll() {
    final _snapshot = _collection.orderBy('date').snapshots();
    return _snapshot.map((data) {  
      return data.documents
          .map((item) => TransactionModel.fromMap(document: item))
          .toList();
    });
  }

  void delete({String id}) => _collection.document(id).delete();

  void addNew({TransactionModel item}) => _collection.add(item.toMap());

  void update({TransactionModel item}) =>
      _collection.document(item.id).updateData(item.toMap());
}
