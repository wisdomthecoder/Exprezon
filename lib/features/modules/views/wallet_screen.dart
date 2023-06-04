
import 'package:exprezon/features/modules/views/ride_detail.dart';
import 'package:exprezon/features/modules/views/sent_to_bank_screen.dart';
import 'package:exprezon/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/navigator.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';
import '../model/ride.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

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
                    'Available Amount'.tr,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  ExprezonText(
                    '\$379.25',
                    fontSize: 24,
                    // textAlign: T//extAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ExprezonFilledButton(
                          text: 'Sent to Bank',
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
                          text: 'Add Amount',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ExprezonText(
                    '    Recent Transactions',
                    color: Colors.grey,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        for (var i = 1; i < 10; i++)
                          ListTile(
                            leading: Image.asset(
                              'assets/images/users/driver.png',
                              width: 50,
                            ),
                            onTap: () => ExprezonNavigator.move(
                                RideDetail(ride: ride), context),
                            title: ExprezonText(
                              ride.driverName,
                              fontSize: 13,
                            ),
                            subtitle: ExprezonText(ride.carType),
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ExprezonText(
                                  '- \$${ride.price}',
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                                ExprezonText(
                                  'Ride Info  >>',
                                  fontSize: 10,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
