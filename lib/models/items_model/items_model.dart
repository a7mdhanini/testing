import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testing/config/helpers.dart';

class ItemsModel {
  String id;
  String title;
  String description;
  String quintity;
  String image;
  String userId;
  String orderTime;

  ItemsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.quintity,
    required this.image,
    required this.userId,
    required this.orderTime,
  });

  factory ItemsModel.fromMap(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      quintity: json['quintity'],
      image: json['image'],
      userId: json['user_id'],
      orderTime: json['order_time'],
    );
  }

  // factory ItemsModel.fromQuery(
  //     QueryDocumentSnapshot<Map<String, dynamic>> doc) {
  //   return ItemsModel(
  //     id: doc['id'],
  //     title: doc['title'],
  //     description: doc['description'],
  //     quintity: doc['quintity'],
  //     image: doc['image'],
  //     userId: doc['user_id'],
  //     orderTime: doc['order_time'],
  //   );
  // }

  factory ItemsModel.fromQuery(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return ItemsModel(
      id: testDocuments(doc, 'id', ''),
      title: testDocuments(doc, 'title', ''),
      description: testDocuments(doc, 'description', ''),
      quintity: testDocuments(doc, 'quintity', ''),
      image: testDocuments(doc, 'image', ''),
      userId: testDocuments(doc, 'user_id', ''),
      orderTime: testDocuments(doc, 'order_time', ''),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'quintity': quintity,
      'image': image,
      'user_id': userId,
      'order_time': orderTime,
    };
  }
}
