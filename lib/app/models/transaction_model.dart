import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  String id;
  double value;
  DateTime date;
  String type;
  String title;

  TransactionModel({
    this.date,
    this.value,
    this.type,
    this.title,
  });

  TransactionModel.fromMap({DocumentSnapshot document}) {
    //this.date = DateTime.parse(document['date']);
    this.value = document['value'];
    this.type = document['type'];
    this.title = document['title'];
    this.id = document.documentID;
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['date'] = this.date;
    map['value'] = this.value;
    map['type'] = this.type;
    map['title'] = this.title;
    return map;
  }
}
