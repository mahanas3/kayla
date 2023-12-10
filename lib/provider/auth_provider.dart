import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  void signUp(BuildContext context) {
    Navigator.pushNamed(context, '/signup');
    notifyListeners();
  }
  void login(BuildContext context){
    Navigator.pushNamed(context, '/loginScreen');
    notifyListeners();
  }
}
