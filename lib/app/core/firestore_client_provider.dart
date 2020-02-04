import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreClientProvider {
  final instanceFirestore = Firestore.instance;
  final instanceAuth = FirebaseAuth.instance;

  Future<CollectionReference> collectionReference(String collection) async {
    final _user = await instanceAuth.currentUser();
    if (_user != null) {
      return instanceFirestore.collection('users').document(_user.uid).collection(collection);
    }
    return instanceFirestore.collection('$collection');
  }
}
