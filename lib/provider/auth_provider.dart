import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayla/services/firebase_services.dart';

import '../routes/route_name.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;

  final firebaseServices = FirebaseServices();

  void signUp(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      loading = true;
      notifyListeners();
      await firebaseServices.signUpWithEmailAndPassword(email, password);
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RouteName.home);
      }
      loading = false;
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something Went Wrong')));
      }
      loading = false;
      notifyListeners();
    }
  }

  void login(BuildContext context) {
    Navigator.pushNamed(context, '/loginScreen');
    notifyListeners();
  }

  void mobileOtp(BuildContext context) {
    Navigator.pushNamed(context, RouteName.mobileOtp);
    notifyListeners();
  }
}
