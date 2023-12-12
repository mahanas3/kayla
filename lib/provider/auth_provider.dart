import 'package:flutter/material.dart';
import 'package:kayla/services/firebase_services.dart';

import '../routes/route_name.dart';

class AuthenticationProvider extends ChangeNotifier {
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

  void login(
      {required BuildContext context,
      required String email,
      required password}) async {
    try {
      loading = true;
      notifyListeners();
      await firebaseServices.signInWithEmailAndPassword(email, password);
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

  void phone(BuildContext context) {
    Navigator.pushNamed(context, RouteName.mobileOtp);
    notifyListeners();
  }

  Future<void> mobileOtp(BuildContext context, String phoneNo) async {
    try {
      loading = true;
      notifyListeners();
      await firebaseServices.getOtp(phoneNo);
      if (context.mounted) {}
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
}
