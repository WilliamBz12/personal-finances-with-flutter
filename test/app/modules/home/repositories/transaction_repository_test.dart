import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';
import 'package:mock_cloud_firestore/mock_types.dart';
import 'package:personal_finances/app/modules/home/repositories/transaction_repository.dart';
import 'package:personal_finances/app/models/transaction_model.dart';

void main() {
  TransactionRepository repository;
  String source;
  MockCloudFirestore mockCloud;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    repository = TransactionRepository();

    source = r"""
{
  "statements": {
    "1": {
      "date" : "1 de janeiro de 2020",
      "type" : "Breakfast",
      "value" : 18.4
    },
    "2": {
      "date" : "2 de janeiro de 2020",
      "type" : "Food",
      "value" : 218.4
    }
  }
}
    """;
    mockCloud = MockCloudFirestore(source);
  });

  group('Firestore Test and repository', () {
    test("First Test", () {
      expect(repository, isInstanceOf<TransactionRepository>());
    });

    test("Fetch stream list", () {
      final list = repository.fetchAll();
      expect(list, isInstanceOf<Stream<List<TransactionModel>>>());
    });

    test('construct', () {
      expect(mockCloud, isNotNull);
    });
    test('fetch collection', () {
      MockCollectionReference collection = mockCloud.collection("statements");
      expect(collection, isNotNull);
    });
    test('collection if cached', () {
      MockCollectionReference collection1 = mockCloud.collection("statements");
      MockCollectionReference collection2 = mockCloud.collection("statements");
      expect(collection1, collection2);
    });

    test("fetch a transaction", () async {
      final collection = mockCloud.collection("statements");
      expect(collection, isNotNull);
      final reference = collection.document("1");
      expect(reference, isNotNull);
      MockDocumentSnapshot snapshot = await reference.get();
      expect(snapshot.data, isNotNull);
      expect(snapshot.data["type"], "Breakfast");
      expect(snapshot.data["value"], 18.4);
    });

    test("fetch a transaction that not exist", () async {
      final collection = mockCloud.collection("statements");
      expect(collection, isNotNull);
      final document = collection.document("3");
      expect(document, isNotNull);
      MockDocumentSnapshot snapshot = await document.get();
      expect(snapshot.data, isNull);
    });

    test('add new document', () async {
      MockCollectionReference collection = mockCloud.collection("statements");
      bool hasData = false;
      collection.snapshots().listen((snapshot) => hasData = true);
      Map<String, dynamic> data = {"value": 10, "type": "Food"};
      await collection.add(data);
      expect(hasData, true);
    });

    test("add new document from server", () async {
      MockCollectionReference collection = mockCloud.collection("statements");

      collection.snapshots().listen((QuerySnapshot snapshot) {
        if (snapshot.documentChanges.length > 0) {
          DocumentSnapshot doc = snapshot.documents[0];
          expect(doc.data, isNotNull);

          DocumentSnapshot doc1 = snapshot.documents[1];
          expect(doc1.data, isNotNull);

          DocumentChange change = snapshot.documentChanges[0];
          expect(change.type, DocumentChangeType.added);
        }
      });

      Map<String, dynamic> data = {"value": 10, "type": "Food"};
      collection.simulateAddFromServer(data);
    });

    test("remove document from server", () async {
      MockCollectionReference collection = mockCloud.collection("statements");
      collection.snapshots().listen((QuerySnapshot snapshot) {
        if (snapshot.documentChanges.length > 0) {
          DocumentSnapshot doc = snapshot.documents[0];
          expect(doc.data, isNotNull);
          DocumentChange change = snapshot.documentChanges[0];
          expect(change.type, DocumentChangeType.removed);
        }
      });
      collection.simulateRemoveFromServer("1");
    });
  });
}
