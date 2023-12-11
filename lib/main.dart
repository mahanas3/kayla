import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kayla/provider/auth_provider.dart';
import 'package:kayla/provider/home_provider.dart';
import 'package:kayla/routes/route_name.dart';
import 'package:kayla/routes/route_navigation.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
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
