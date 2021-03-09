import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/strings.dart';
import 'package:rasan_mart/core/themes/app_theme.dart';
import 'package:rasan_mart/presentation/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.authentication,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
