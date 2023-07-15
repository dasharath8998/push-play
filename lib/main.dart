import 'package:flutter/material.dart';
import 'package:pushplay/routes/app_routes.dart';
import 'package:pushplay/theme/app_theme.dart';
import 'package:pushplay/utils/size_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.init(constraints, orientation);
            return MaterialApp.router(
              title: 'Push Play',
              theme: AppTheme.lightTheme(),
              routerConfig: AppRoutes().router,
            );
          }
        );
      }
    );
  }
}
