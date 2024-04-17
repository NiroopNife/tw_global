import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_global/utils/app_routes.dart';

import 'locator.dart';
import 'utils/custom_theme_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pixabay Photos',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      getPages: AppRoutes.routes,
    );
  }
}