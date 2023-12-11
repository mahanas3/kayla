import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreServices {
  final _fireStore = FirebaseFirestore.instance;

  Future addStudent(
      {required String name, required String age, required File image}) async {
    try {

      var imageName = DateTime.now().millisecondsSinceEpoch.toString();
      var storageRef = FirebaseStorage.instance.ref().child('driver_images/$imageName.jpg');
      var uploadTask = storageRef.putFile(image);
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();
      await _fireStore
          .collection('Students')
          .add({"name": name, "age": age, "image": downloadUrl});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
