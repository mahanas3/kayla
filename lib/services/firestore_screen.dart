import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  final _fireStore = FirebaseFirestore.instance;

  Future addStudent({required String name, required String age}) async {
    try {
      print(name);
      print(age);
      await _fireStore.collection('Students').add({"name": name, "age": age});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
