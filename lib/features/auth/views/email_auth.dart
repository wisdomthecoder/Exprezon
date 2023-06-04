import 'dart:io';

import 'package:exprezon/constants/sizes.dart';
import 'package:exprezon/features/auth/views/otp_screen.dart';
import 'package:exprezon/helpers/navigator.dart';
import 'package:exprezon/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/statusbar.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

XFile? image;

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  String otp = '';

  pickImage(ImageSource imageSource) async {
    var pickImage =
        await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
    image = pickImage;
    setState(() {});
  }

  final TextEditingController phoneController =
      TextEditingController(text: '8146626426');
  final TextEditingController nameController =
      TextEditingController(text: 'Wisdom Dauda');
  final TextEditingController emailController =
      TextEditingController(text: 'codewithwise@gmail.com');
//FN: Focus Node
  final FocusNode phoneFN = FocusNode();
  final FocusNode nameFN = FocusNode();
  final FocusNode emailFN = FocusNode();

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
            IconButton(
              color: Colors.teal,
              onPressed: () => showSettings(context),
              icon: const Icon(Icons.settings),
            ),
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
                    'signup'.tr,
                    fontSize: 24,
                    // textAlign: T//extAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  ExprezonText(
                    'requireNotice'.tr,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                        child: image != null
                            ? Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              )
                            : const Icon(
                                Icons.people,
                                size: 50,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IntlPhoneField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(),
                      // ),
                    ),
                    dropdownIconPosition: IconPosition.trailing,
                    flagsButtonPadding: EdgeInsets.zero,
                    controller: phoneController,
                    focusNode: phoneFN,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {
                      //FN: Focus Node
                      // Move focus to the next field
                      FocusScope.of(context).requestFocus(nameFN);
                    },
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      setState(() {});
                    },
                  ),
                  // SizedBox(height: 10.0),
                  TextField(
                    //FN: Focus Node
                    controller: nameController,
                    focusNode: nameFN,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {
                      // Move focus to the next field
                      FocusScope.of(context).requestFocus(emailFN);
                    },
                    decoration: InputDecoration(
                      labelText: 'name'.tr,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: emailController,
                    focusNode: emailFN,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      // Perform any action you want when the last field is submitted
                    },
                    decoration: InputDecoration(
                      labelText: 'email'.tr,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: SizedBox(
                    width: ExprezonSizes.width(context) / 1.2,
                    child: ExprezonFilledButton(
                        text: 'continue'.tr,
                        onPressed: () {
                          ExprezonNavigator.move(
                              OTPScreen(phone: '+23481622626426'), context);
                        }),
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
