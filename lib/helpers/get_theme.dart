import 'package:exprezon/constants/persistence.dart';
import 'package:exprezon/themes/theme_data.dart';
import 'package:flutter/material.dart';

ThemeData getTheme() {
  return box.read('themeIndex') == 1 ? lightTheme : darkTheme;
}
