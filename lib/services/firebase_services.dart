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
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }


  Future getOtp(String phoneNo) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+917736848926',
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          print('fghj');
          },
          verificationFailed: (FirebaseAuthException error) {},
          codeSent: (String verificationId, int? forceResendingToken) {},
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
