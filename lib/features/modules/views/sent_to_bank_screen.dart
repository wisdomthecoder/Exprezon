
import 'package:exprezon/constants/sizes.dart';
import 'package:exprezon/helpers/navigator.dart';
import 'package:exprezon/widgets/text.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';

import '../../../widgets/filled_button.dart';
import '../../../widgets/statusbar.dart';
// import 'phone_auth.dart';

class SentToBankScreen extends StatefulWidget {
  const SentToBankScreen({super.key});

  @override
  State<SentToBankScreen> createState() => _SentToBankScreenState();
}

XFile? image;

class _SentToBankScreenState extends State<SentToBankScreen> {
  final TextEditingController nameController =
      TextEditingController(text: 'Wisdom Dauda');
  final TextEditingController accountController =
      TextEditingController(text: '4029298017');
  final TextEditingController bankNameController =
      TextEditingController(text: 'Providus Bank');
  final TextEditingController amountToTransferController =
      TextEditingController(text: '\$140');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ExprezonStatusBar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => ExprezonNavigator.back(context),
              color: Colors.teal,
              icon: const Icon(Icons.arrow_back_ios),
            ),
            //   IconButton(
            //     color: Colors.teal,
            //     onPressed: () => showSettings(context),
            //     icon: Icon(Icons.settings),
            //   ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExprezonText(
                    'Available Amount'.tr,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  ExprezonText(
                    '\$379.25'.tr,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Bank Name'.tr,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: accountController,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Account Number'.tr,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: bankNameController,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Bank Name'.tr,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: amountToTransferController,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Amount to Transfer'.tr,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: SizedBox(
                    width: ExprezonSizes.width(context),
                    child: ExprezonFilledButton(
                        text: 'Submit'.tr, onPressed: () {}),
                  ))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
