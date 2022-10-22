import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mylink/screen/link/link_screen.dart';

import '../screen/home/home_screen.dart';

part 'app_route.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(page: HomeScreen, initial: true),
  AutoRoute(path: '/:title', page: LinkScreen),
])
class AppRoute extends _$AppRoute {
  AppRoute._();

  static final instance = AppRoute._();
}
