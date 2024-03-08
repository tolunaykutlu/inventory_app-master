import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/models/fason_kesim_model.dart';
import 'package:inventory_app/models/product_model.dart';

class FirestoreCommands extends ChangeNotifier {
  final _firestoreInstance = FirebaseFirestore.instance;

  Future updateDataToFirestore(
<<<<<<< HEAD
      Map<String, dynamic> data, String docName, String colName) async {
    try {
      await _firestoreInstance.collection(colName).doc(docName).update(data);
=======
      String collectionName, Map<String, dynamic> data, String docName) async {
    try {
      await _firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .update(data);
>>>>>>> 656813f9e27efb1fb6ce6af3a20221e3adc6c16d
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<List<ProductModel>> getAllDocumentsStreamFromFirestore(
      String collectionName) {
    final collectionRef = FirebaseFirestore.instance.collection(collectionName);

    return collectionRef
        .orderBy("entryDate", descending: false)
        .limit(25)
        .snapshots()
        .map((querySnapshot) {
      try {
        return querySnapshot.docs.map((snapshot) {
          final data = snapshot.data();
          //data['id'] = snapshot.id;

          return ProductModel.fromMap(data);
        }).toList();
      } catch (e) {
        return []; // empty list for error
      }
    });
  }

  Stream<List<FasonWork>> getAllFasonDocumentsStreamFromFirestore(
      String collectionName) {
    final collectionRef = FirebaseFirestore.instance.collection(collectionName);

    return collectionRef
        .orderBy("entryDate", descending: false)
        .limit(25)
        .snapshots()
        .map((querySnapshot) {
      try {
        return querySnapshot.docs.map((snapshot) {
          final data = snapshot.data();
          data['id'] = snapshot.id;

          return FasonWork(
            adet: data["adet"],
            writerId: data["writerId"],
            id: data['id'],
            firmName: data["firmName"],
            boy: data["boy"],
            kilo: data["kilo"],
            entryDate: data["entryDate"],
            quality: data["quality"],
            thickness: data["thickness"],
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
