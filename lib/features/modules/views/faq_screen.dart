import 'package:exprezon/features/modules/model/faq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/navigator.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
                    'FAQs'.tr,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  ExprezonText(
                    'Read FAQs solutions'.tr,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  ...faqs.map<Widget>((FAQ item) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ExpansionPanelList(
                        elevation: 4,
                        expandedHeaderPadding: const EdgeInsets.all(0),
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            item.isExpanded = !isExpanded;
                          });
                        },
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                minVerticalPadding: 0,
                                title: ExprezonText(
                                  item.questionType,
                                  fontSize: 10,
                                ),
                                subtitle: ExprezonText(
                                  item.question,
                                  fontSize: 14,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? null
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            },
                            body: ListTile(
                              title: ExprezonText(
                                item.answer,
                                fontSize: 12,
                              ),
                            ),
                            isExpanded: item.isExpanded,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
