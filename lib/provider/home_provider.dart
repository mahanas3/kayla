import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayla/services/firestore_services.dart';

import '../routes/route_name.dart';

class HomeProvider extends ChangeNotifier {
  double _minValue = 0.0;
  double _maxValue = 50.0;

  double get minValue => _minValue;

  double get maxValue => _maxValue;

  bool  loading = false;

  List<Map<String, dynamic>> users = [];

  File ?image;

  void home(BuildContext context) {
    Navigator.pushNamed(context, '/home');
    notifyListeners();
  }

  void setMinSliderValue(double value) {
    _minValue = value;
    notifyListeners();
  }

  void setMaxSliderValue(double value) {
    _maxValue = value;
    notifyListeners();
  }

  void userDetails(BuildContext context) {
    Navigator.pushNamed(context, '/userDetails');
    notifyListeners();
  }

  void signOut(BuildContext context) {
    Navigator.pushNamed(context, '/logIn');
    notifyListeners();
  }

  Future save(
    BuildContext context,
    String name,
    String age,
      File image
  ) async {
    try {
      loading = true;
      notifyListeners();


      await FireStoreServices().addStudent(name: name, age: age, image: image);
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
  void getImage(String value){

  }
}
