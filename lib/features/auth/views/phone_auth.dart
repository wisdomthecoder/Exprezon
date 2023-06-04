
import 'package:exprezon/features/auth/views/otp_screen.dart';
import 'package:exprezon/helpers/navigator.dart';
import 'package:exprezon/widgets/statusbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/text.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  String phoneController = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExprezonText(
                  'phoneInput'.tr,
                  fontSize: 24,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 5,
                ),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'NG',
                  onChanged: (phone) {
                    phoneController = phone.completeNumber;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ExprezonFilledButton(
                  text: 'continue'.tr,
                  onPressed: () {
                    ExprezonNavigator.move(
                        OTPScreen(phone: phoneController), context);
                    print(phoneController);
                  },
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
