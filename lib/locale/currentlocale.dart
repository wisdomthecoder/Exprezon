import 'package:exprezon/constants/persistence.dart';
import 'package:flutter/material.dart';

Locale defaultLocale() {
  bool? isEnglish = localeStorage.read('locale');
  if (isEnglish == true) {
    return const Locale('en', 'US');
  } else if (isEnglish == null) {
    localeStorage.write('locale', true);
    return const Locale('en', 'US');
  } else {
    return const Locale('ha', "NG");
  }
}
