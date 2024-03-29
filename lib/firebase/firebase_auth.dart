import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/firebase/firestore_commands.dart/firestore_functions.dart';

class AuthProvider extends ChangeNotifier {
  final firebaseFnc = FirestoreCommands();

  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }

  Future createAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebaseFnc.addUsersToDb(email, password, credential.user?.uid);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}

final authProvider = Provider((ref) {
  return AuthProvider();
});
