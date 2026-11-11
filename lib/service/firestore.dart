
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestore {
  Firestore._();
  static final instace = Firestore._();
  final _firestore = FirebaseFirestore.instance;
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firestore.doc(path);
    debugPrint('Reguest data $data');

    await reference.set(data);
  }
  

  Future<void> deleteData({required String path}) async {
    final reference = _firestore.doc(path);
    debugPrint('Reguest data $path');
    await reference.delete();
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final reference = _firestore.doc(path);
    final snapshot = reference.snapshots();
    return snapshot.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T hls, T rhs)? sort,
  }) {
    Query query = _firestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshot = query.snapshots();

    return snapshot.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) =>
                builder(snapshot.data() as Map<String, dynamic>, snapshot.id),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
  Future<T> getDocument<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
  }) async {
    final reference = _firestore.doc(path);
    final snapshot = await reference.get();
    return builder(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  Future<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) async {
    Query query = _firestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = await query.get();
    final result = snapshots.docs
        .map((snapshot) => builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
        .where((value) => value != null)
        .toList();
    if (sort != null) {
      result.sort(sort);
    }
    return result;
  }
}
