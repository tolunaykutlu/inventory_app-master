import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/models/fason_kesim_model.dart';
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

  Stream<List<FasonWork>> getAllFasonDocumentsStreamFromFirestore(
      String collectionName) {
    final collectionRef = FirebaseFirestore.instance.collection(collectionName);

    return collectionRef.snapshots().map((querySnapshot) {
      try {
        return querySnapshot.docs.map((snapshot) {
          final data = snapshot.data();
          data['id'] = snapshot.id;

          return FasonWork(
            id: data['id'],
            firmName: data["firmName"],
            boy: data["boy"],
            kilo: data["kilo"],
            date: data["date"],
            pQuality: data["pQuality"],
            pThickness: data["pThickness"],
            en: data["en"],
            description: data["description"],
          );
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

  Future<void> deleteDocumentFromFirestore1(
    String collectionName,
  ) async {
    final documentRef =
        FirebaseFirestore.instance.collection(collectionName).doc();

    try {
      await documentRef.delete();
    } catch (e) {
      // Handle error as needed
    }
  }

  Future addProductToStokDb(
    //stokDatabaseCollection
    String collectName,
    ProductModel product,
  ) async {
    {
      await _firestoreInstance.collection(collectName).add(product.toMap());
    }
  }

//fasonDatabaseCollection
  Future addProductToFasonDb(
    FasonWork fason,
  ) async {
    {
      await _firestoreInstance.collection("fasons").add(fason.toMap());
    }
  }
}

final firebaseProvider = Provider<FirestoreCommands>((ref) {
  return FirestoreCommands();
});
