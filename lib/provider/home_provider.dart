import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  double _minValue = 0.0;
  double _maxValue = 50.0;

  double get minValue => _minValue;

  double get maxValue => _maxValue;

  List<Map<String,dynamic>> users = [];

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

  void save(
    BuildContext context,
    String name,
    String age,
  ) {
    users.add({"name": name, "age": age});
    Navigator.pushNamed(
      context,
      '/home',
    );
    notifyListeners();
  }
}
