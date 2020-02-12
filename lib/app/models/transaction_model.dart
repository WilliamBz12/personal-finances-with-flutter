import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_finances/app/models/category_model.dart';
import 'package:personal_finances/app/shared/utils/categories.dart';

class TransactionModel {
  String id;
  double value;
  DateTime date;
  String type;
  String description;

  TransactionModel({
    this.date,
    this.value,
    this.type,
    this.description,
  });

  
  

  TransactionModel.fromMap({DocumentSnapshot document}) {
    //this.date = DateTime.parse(document['date']);
    this.value = document['value'];
    this.type = document['type'];
    this.description = document['description'];
    this.id = document.documentID;
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['date'] = this.date;
    map['value'] = this.value;
    map['type'] = this.type;
    map['description'] = this.description;
    return map;
  }
  
  CategoryModel get category => Categories.categoryById(id: type);

  String get valueInReal =>
     "R\$ ${value.toStringAsFixed(2).replaceAll(".", ",")}";
}