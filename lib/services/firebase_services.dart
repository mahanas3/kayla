import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future getOtp(String phoneNo) async {
    try {
      await _firebaseAuth.signInWithPhoneNumber(phoneNo);
    } catch (e) {
      rethrow;
    }
  }
}
