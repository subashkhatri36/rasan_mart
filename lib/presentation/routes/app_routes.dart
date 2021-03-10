import 'package:flutter/material.dart';
import 'package:rasan_mart/core/exceptions/exceptions.dart';
import 'package:rasan_mart/presentation/pages/authpage/authpage.dart';
import 'package:rasan_mart/presentation/pages/homepage/homepage.dart';
import 'package:rasan_mart/presentation/pages/product_detail/product_details.dart';
import 'package:rasan_mart/presentation/pages/search_page/search_page.dart';

class AppRouter {
  static const String authentication = '/';
  static const String home = '/dashboard';
  static const String search = '/search';
  static const String productdetail = '/productdetail';

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
        break;
      case productdetail:
        return MaterialPageRoute(
            builder: (_) => ProductDetails(
                  productDetails: settings.arguments,
                ));
        break;
      case search:
        return MaterialPageRoute(
          builder: (_) => SearchPage(),
        );
        break;
      default:
        throw const RouteException('Route not found!');
    }
  }
}
