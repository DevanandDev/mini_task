import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;
  String errorMessage = '';

  Future<bool> loginProvider() async {
    try {
      isLoading = true;
      notifyListeners();

      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message ?? 'Login failed';
      return false;
    } catch (e) {
      errorMessage = 'Something went wrong';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
