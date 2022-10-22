import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  Size get mediaSize => MediaQuery.of(this).size;
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
  ScaffoldMessengerState get snackbar => ScaffoldMessenger.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}
