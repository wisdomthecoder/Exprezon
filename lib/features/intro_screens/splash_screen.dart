import 'dart:async';
import 'package:exprezon/features/auth/views/initial_auth.dart';
import 'package:exprezon/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/assets.dart';
import '../../constants/sizes.dart';
import '../../services/network_handler.dart';
import '../auth/views/phone_auth.dart';
import '../modules/views/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void isFirstTime() async {
    var token = await NetworkHandler.getToken();

    SharedPreferences prefs = await SharedPreferences
        .getInstance(); //create an instance of shared preference class
    bool? isFirstTime = prefs.getBool('first_time');

    if (isFirstTime != null && !isFirstTime && token == null) {
      prefs.setBool('first_time', false);
      Get.offAll(() => const InitialAuthPage());
      //Get.offAll(() => Onbording());
    } else if (isFirstTime != null && !isFirstTime && token!.isNotEmpty) {
      prefs.setBool('first_time', false);
      Get.offAll(() => const Dashboard());
      //Get.offAll(() => Onbording());
    } else {
      prefs.setBool('first_time', false);
      Get.offAll(() => const PhoneAuth());
    }
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() async {
    bool isLoggedIn = await getUserLoginStatuss();
    isLoggedIn ? Get.offAll(() => const Dashboard()) : isFirstTime();
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<bool> getUserLoginStatuss() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExprezonColors.iconbg,
      body: SizedBox(
        width: ExprezonSizes.width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                ExprezonImages.appicon,
                width: ExprezonSizes.width(context) * 0.79,
                height: ExprezonSizes.height(context) * 0.300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
