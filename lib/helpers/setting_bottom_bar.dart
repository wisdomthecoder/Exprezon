import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/persistence.dart';
import '../themes/theme_colors.dart';
import '../themes/theme_data.dart';
import '../widgets/filled_button.dart';
import '../widgets/text.dart';

int themeIndex = box.read('themeIndex') ?? 2;

int _languageInt = box.read('themeIndex') ?? 1;
showSettings(BuildContext context) => showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: ExprezonText('Back'),
                    ),
                    ExprezonText(
                      'Basic Settings',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: ExprezonColors.shadowColor,
                      thickness: 3,
                    ),
                    ExprezonText('Choose Theme', fontWeight: FontWeight.bold),
                    Row(
                      children: [
                        Radio(
                          // title: ExprezonText('Light Mode'),
                          value: 1,
                          groupValue: themeIndex,
                          onChanged: (value) {
                            setState(() {
                              themeIndex = value!;
                            });
                          },
                        ),
                        ExprezonText('Dark Mode')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          // title: ExprezonText('Light Mode'),
                          value: 2,
                          groupValue: themeIndex,
                          onChanged: (value) {
                            setState(() {
                              themeIndex = value!;
                            });
                          },
                        ),
                        ExprezonText('Light Mode'),
                      ],
                    ),
                    const Divider(
                      color: ExprezonColors.shadowColor,
                      thickness: 3,
                    ),
                    ExprezonText('Choose Language',
                        fontWeight: FontWeight.bold),
                    Row(
                      children: [
                        Radio(
                          // title: ExprezonText('Light Mode'),
                          value: 1,
                          groupValue: _languageInt,
                          onChanged: (value) {
                            setState(() {
                              _languageInt = value!;
                            });
                          },
                        ),
                        ExprezonText('English')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          // title: ExprezonText('Light Mode'),
                          value: 2,
                          groupValue: _languageInt,
                          onChanged: (value) {
                            setState(() {
                              _languageInt = value!;
                            });
                          },
                        ),
                        ExprezonText('Hausa'),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ExprezonFilledButton(
                        text: 'Configure',
                        onPressed: () {
                          Get.changeTheme(
                              themeIndex != 1 ? lightTheme : darkTheme);
                          box
                              .write('themeIndex', themeIndex)
                              .then((value) => print('Wisdom'));
                          box.write('languageInt', _languageInt);
                          Get.updateLocale(_languageInt == 1
                              ? const Locale('en', 'US')
                              : const Locale('ha', 'NG'));
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
