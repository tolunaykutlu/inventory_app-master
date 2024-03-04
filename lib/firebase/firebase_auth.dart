import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends ChangeNotifier {
  Future signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          break;
        default:
      }
    }
  }

  signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future createAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  userID() {
    String uid = "";

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uid = user.uid;
      }
    });
    return uid;
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Handle successful sign-in (e.g., navigate to the main page)
      // Replace with your desired action after successful login
      print("Successfully signed in!");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          // User does not exist
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User not found. Please check your email address.'),
            ),
          );
          print("User not found.");
          break;
        case 'wrong-password':
          // Incorrect password
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Wrong password. Please try again.'),
            ),
          );
          print("Wrong password.");
          break;
        case 'invalid-email':
          // Invalid email format
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Invalid email format. Please enter a valid email address.'),
            ),
          );
          print("Invalid email format.");
          break;
        case 'too-many-requests':
          // Throttled due to too many requests
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Too many requests. Please try again later.'),
            ),
          );
          print("Too many requests. Please try again later.");
          break;
        case 'operation-not-allowed':
          // Email/password authentication is disabled
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Email/password authentication is disabled. Contact support.'),
            ),
          );
          print("Email/password authentication is disabled.");
          break;
        default:
          // Handle other unexpected errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('An unexpected error occurred. Please try again later.'),
            ),
          );
          print("An unexpected error occurred: ${e.code}");
          break;
      }
    }
  }
}

final authProvider = Provider((ref) {
  return AuthProvider();
});
