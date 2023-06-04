import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExprezonStatusBar extends StatelessWidget {
  Color? color;
  ExprezonStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Get.isDarkMode
          ? Colors.black.withOpacity(.0)
          : color ?? Colors.teal,
    );
  }
}
