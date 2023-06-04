import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ExprezonNavigator {
  static move(Widget page, BuildContext context) {
    Navigator.of(context).push(PageTransition(
      type: PageTransitionType.rightToLeftWithFade,
      child: page,
    ));
  }

  static moveAndRemove(Widget page, BuildContext context) {
    Navigator.of(context).pushReplacement(PageTransition(
      type: PageTransitionType.leftToRightWithFade,
      child: page,
    ));
  }

  static back(BuildContext context) {
    Navigator.of(context).pop();
  }

  static openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
