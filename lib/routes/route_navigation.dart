import 'package:flutter/material.dart';
import 'package:kayla/routes/route_name.dart';
import 'package:kayla/screens/auth_screen/login_screen.dart';
import 'package:kayla/screens/auth_screen/mobileotp_screen.dart';
import 'package:kayla/screens/auth_screen/signup_screen.dart';
import 'package:kayla/screens/home_screen/home_page.dart';
import 'package:kayla/screens/home_screen/userdetails_screen.dart';

class AppRoute {
  static Route<dynamic> routeSetting(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case RouteName.signup:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );
      case RouteName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteName.userDetails:
        return MaterialPageRoute(
          builder: (context) => const UserDetails(),
        );
      case RouteName.signOut:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case RouteName.mobileOtp:
        return MaterialPageRoute(
          builder: (context) => const MobileOtp(),
        );

      default:
        {
          return MaterialPageRoute(
            builder: (context) => const Login(),
          );
        }
    }
  }
}
