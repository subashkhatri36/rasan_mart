import 'package:flutter/material.dart';
import 'package:rasan_mart/core/exceptions/exceptions.dart';
import 'package:rasan_mart/presentation/pages/authpage/authpage.dart';
import 'package:rasan_mart/presentation/pages/homepage/homepage.dart';

class AppRouter {
  static const String authentication = '/';
  static const String home = '/dashboard';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authentication:
        return MaterialPageRoute(
          builder: (_) => AuthenticationPage(),
        );
        break;
      case home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
