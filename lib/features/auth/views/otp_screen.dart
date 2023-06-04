import 'package:exprezon/constants/sizes.dart';
import 'package:exprezon/helpers/navigator.dart';
import 'package:exprezon/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/statusbar.dart';
import '../../otherscreens/add_card.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  String phone;
  OTPScreen({required this.phone, super.key});

  @override
  State<OTPScreen> createState() => OTPScreenState();
}

class OTPScreenState extends State<OTPScreen> {
  String otp = '';
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    // Immediately request focus when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

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
                  'otp_sent'.tr,
                  fontSize: 24,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExprezonText(
                      'Otp Sent to ${widget.phone}',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                    TextButton(
                        onPressed: () {}, child: ExprezonText('change'.tr))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  autoFocus: true,

                  fieldWidth: ExprezonSizes.width(context) / 8,

                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  enabledBorderColor: Colors.teal,
                  //runs when a code is typed in

                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    otp = verificationCode;
                    setState(() {});
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: ExprezonText('${'resend'.tr} OTP')),
                const SizedBox(
                  height: 10,
                ),
                ExprezonFilledButton(
                  text: 'continue'.tr,
                  onPressed: otp.isEmpty
                      ? null
                      : () {
                          ExprezonNavigator.move(
                              const AddCreditCardScreen(), context);
                        },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
