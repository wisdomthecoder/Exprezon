import 'package:exprezon/features/modules/views/profile_screen.dart';
import 'package:exprezon/features/modules/views/rides_screen.dart';
import 'package:flutter/material.dart';

import '../views/contact_us.dart';
import '../views/faq_screen.dart';
import '../views/wallet_screen.dart';

class ExprezonDrawerButton {
  String title;
  IconData icon;
  Widget? page;
  ExprezonDrawerButton({
    required this.title,
    required this.icon,
    this.page,
  });
}

List<ExprezonDrawerButton> exprezonDrawerButtons = [
  ExprezonDrawerButton(
    title: 'Home',
    icon: Icons.home,
    // page: () => Get.back(),
  ),
  ExprezonDrawerButton(
    title: 'My Profile',
    icon: Icons.person,
    page: const ProfileScreen(),
  ),
  ExprezonDrawerButton(
    title: 'My Rides',
    icon: Icons.emoji_transportation,
    page: const MyRidesScreen(),
  ),
  ExprezonDrawerButton(
    title: 'Wallet',
    icon: Icons.wallet,
    page: const WalletScreen(),
  ),
  ExprezonDrawerButton(
    title: 'Promo Code',
    icon: Icons.local_offer,
  ),
  ExprezonDrawerButton(
    title: 'Settings',
    icon: Icons.settings,
  ),
  ExprezonDrawerButton(
    title: 'FAQs',
    icon: Icons.help,
    page: const FAQScreen(),
  ),
  ExprezonDrawerButton(
    title: 'Contact Us',
    icon: Icons.mail,
    page: const ContactScreen(),
  ),
];
