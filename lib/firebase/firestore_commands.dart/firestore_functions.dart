import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/models/product_model.dart';

class FirestoreCommands extends ChangeNotifier {
  final _firestoreInstance = FirebaseFirestore.instance;

  /* Future addDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await _firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .set(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  } */

  /* Future<List<Map<String, dynamic>>> getAllDocumentsFromFirestore(
      String collectionName) async {
    final collectionRef = FirebaseFirestore.instance
        .collection(collectionName); // Replace with your actual collection name

    try {
      final querySnapshot =
          await collectionRef.orderBy("entryDate", descending: false).get();

      final documents = querySnapshot.docs.map((snapshot) {
        final data = snapshot.data();

        //  document ID
        data['id'] = snapshot.id;

        //DataClass().addProduct(ProductModel.fromMap(data));

        return data;
      }).toList();

      return documents;
    } on FirebaseException catch (e) {
      print(e.message);
      return [];
    }
  } */

  Stream<List<ProductModel>> getAllDocumentsStreamFromFirestore(
      String collectionName) {
    final collectionRef = FirebaseFirestore.instance.collection(collectionName);

    return collectionRef
        .orderBy("entryDate", descending: false)
        .snapshots()
        .map((querySnapshot) {
      try {
        return querySnapshot.docs.map((snapshot) {
          final data = snapshot.data();
          data['id'] = snapshot.id;

          return ProductModel(
              id: data["id"],
              boy: data["boy"],
              en: data["en"],
              entryDate: data["entryDate"],
              fiyat: data["fiyat"],
              hasPvc: data["hasPvc"],
              kilo: data["kilo"],
              quality: data["quality"],
              thickness: data["thickness"]);
        }).toList();
      } catch (e) {
        // Handle error

        return []; // empty list for error
      }
    });
  }

  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }

  Future<void> deleteDocumentFromFirestore(
    String collectionName,
    String docId,
  ) async {
    final documentRef =
        FirebaseFirestore.instance.collection(collectionName).doc(docId);

    try {
      await documentRef.delete();
    } catch (e) {
      // Handle error as needed
    }
  }

  Future<void> deleteDocumentOnLongPress(
    //bu kullanılmıyor
    String collectionName,
    String docId, {
    required BuildContext context, // For showing confirmation or feedback
  }) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection(collectionName).doc(docId).delete();
    } on FirebaseException catch (e) {
      e.toString();
    }
  }

  Future addProductToDb(
    //kalitesine göre dokuman adıver ve ekle
    String collectName,
    ProductModel p,
  ) async {
    {
      await _firestoreInstance.collection(collectName).add(p.toMap());
    }
  }

  Future addProductToDbColl(
    String cName,
    ProductModel p,
  ) async {
    {
      await _firestoreInstance.collection(cName).add(p.toMap());
    }
  }
}

final firebaseProvider = Provider<FirestoreCommands>((ref) {
  return FirestoreCommands();
});
