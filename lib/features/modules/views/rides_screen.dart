
import 'package:exprezon/features/modules/views/ride_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/navigator.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';
import '../model/ride.dart';

class MyRidesScreen extends StatelessWidget {
  const MyRidesScreen({super.key});

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExprezonText(
            'My Rides'.tr,
            fontSize: 24,
            // textAlign: T//extAlign.center,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExprezonText(
            'List of Rides you Booked'.tr,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => ExprezonNavigator.move(
                          RideDetail(ride: ride), context),
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,
                        ),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white10
                                    : const Color.fromARGB(61, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/users/driver.png',
                                      height: 60,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ExprezonText(
                                          ride.driverName,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        ExprezonText(
                                          '${ride.carType}\n${ride.dateTime}',
                                          textAlign: TextAlign.start,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ExprezonText(
                                        ride.price.toString(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      ExprezonText(
                                        ride.paidFrom,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Color.fromARGB(255, 3, 145, 112),
                                      ),
                                      ExprezonText(
                                        '43 Wanpyak Street, Mangu, PL, 9ja',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.navigation,
                                        color: Color.fromARGB(255, 3, 145, 112),
                                      ),
                                      ExprezonText(
                                        '43 Wanpyak Street, Mangu, PL, 9ja',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
