import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/config/theme/app_theme.dart';
import '/config/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      builder: (_, _) => MaterialApp.router(
        theme: AppTheme.appTheme,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
