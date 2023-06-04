import 'package:exprezon/constants/sizes.dart';
import 'package:exprezon/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ExprezonSizes.width(context),
      height: ExprezonSizes.width(context) / 2.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Colors.teal,
          Colors.teal.shade900,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'credit_card'.tr,
              style: GoogleFonts.getFont(
                'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '1234 5678 9012 3456',
              style: GoogleFonts.robotoSlab(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ExprezonText(
                    'Wisdom Dauda',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                ExprezonText(
                  'Exp: 12/24',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
