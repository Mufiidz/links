import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:mylink/di/main_module.dart';
import 'package:mylink/res/mycolors.dart';

import 'data/firebase_config.dart';
import 'route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseConfig.options);
  setUrlStrategy(PathUrlStrategy());
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mufidz Links',
      theme: ThemeData(
        primarySwatch:  MyColors.primary,
        useMaterial3: true
      ),
      routerDelegate: AppRoute.instance.delegate(),
      routeInformationParser: AppRoute.instance.defaultRouteParser(),
    );
  }
}
