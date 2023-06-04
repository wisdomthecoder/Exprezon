import 'package:exprezon/features/modules/views/sent_to_bank_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/navigator.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExprezonText(
                    'Contact Us',
                    fontSize: 24,
                    // textAlign: T//extAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  ExprezonText(
                    'Let us know your Issue & Feedback'.tr,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ExprezonFilledButton(
                          text: 'Call Us',
                          onPressed: () {
                            ExprezonNavigator.move(const SentToBankScreen(), context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ExprezonFilledButton(
                          text: 'Email Us',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ExprezonText(
                    'Write Us',
                    fontSize: 18,
                    // textAlign: T//extAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  ExprezonText(
                    'Describe your issue or feedback'.tr,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller:
                        TextEditingController(text: 'codewithwise@gmail.com'),
                    decoration: InputDecoration(
                      label: ExprezonText(
                        'Your Email Address',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller:
                        TextEditingController(text: 'Write your Message'),
                    decoration: InputDecoration(
                      label: ExprezonText(
                        'Describe your issue or feedback',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ExprezonFilledButton(
                      text: 'Send',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
