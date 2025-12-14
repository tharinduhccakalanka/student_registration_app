import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:student_registration_app/helpers/alert_helpers.dart';

class AuthController {

  /// 🔐 Signup User
  Future<void> signupUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        Logger().i("User Signed Up Successfully");
        AlertHelper.showSuccess(
          context,
          "User registered successfully ✅",
        );
      } else {
        Logger().w("User Sign Up Failed");
        AlertHelper.showError(
          context,
          "Signup failed",
        );
      }

    } on FirebaseAuthException catch (e) {
      AlertHelper.showError(
        context,
        _firebaseError(e.code),
      );

    } catch (e) {
      AlertHelper.showError(
        context,
        "Something went wrong",
      );
    }
  }

  /// 🔍 Firebase error messages
  String _firebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return "Email already exists";
      case 'invalid-email':
        return "Invalid email address";
      case 'weak-password':
        return "Password is too weak";
      default:
        return "Signup failed. Try again";
    }
  }
}
