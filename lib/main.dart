import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kayla/provider/auth_provider.dart';
import 'package:kayla/provider/home_provider.dart';
import 'package:kayla/routes/route_name.dart';
import 'package:kayla/routes/route_navigation.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAppCheck.instance.activate();


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthentificationProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
    ],
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.loginScreen,
      onGenerateRoute: AppRoute.routeSetting,
    );
  }
}
