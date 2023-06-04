import 'package:exprezon/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../helpers/navigator.dart';
import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';
// import '../../../widgets/text.dart';

class CarSelectionPage extends StatefulWidget {
  const CarSelectionPage({super.key});

  @override
  _CarSelectionPageState createState() => _CarSelectionPageState();
}

class _CarSelectionPageState extends State<CarSelectionPage> {
  String? selectedCar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      body: Container(
        decoration: BoxDecoration(
          color: themeIndex != 1
              ? const Color.fromARGB(255, 7, 0, 0)
              : const Color.fromARGB(255, 252, 249, 249),
          image: DecorationImage(
            fit: BoxFit.fill,
            opacity: themeIndex != 1 ? .9 : .9,
            image: AssetImage(
              themeIndex == 1 ? ExprezonImages.map : ExprezonImages.mapwithcars,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExprezonStatusBar(),
            IconButton(
              onPressed: () {
                ExprezonNavigator.back(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.teal,
                size: 24,
              ),
            ),
            for (var i = 0; i < 4; i++) const Spacer(),
            Container(
              margin: const EdgeInsets.all(15),
              // height: 150,
              decoration: BoxDecoration(
                  color: themeIndex == 1
                      ? const Color.fromARGB(177, 22, 22, 22)
                      : const Color.fromARGB(188, 241, 238, 238),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CarCard(
                        image: ExprezonImages.car1,
                        price: '40.50',
                        rideType: 'Go Share',
                        selected: selectedCar == 'car1',
                        onTap: () {
                          setState(() {
                            selectedCar = 'car1';
                          });
                        },
                      ),
                      CarCard(
                        image: ExprezonImages.car2,
                        price: '65.50',
                        rideType: 'Go Private',
                        selected: selectedCar == 'car2',
                        onTap: () {
                          setState(() {
                            selectedCar = 'car2';
                          });
                        },
                      ),
                      CarCard(
                        image: ExprezonImages.car3,
                        price: '128.50',
                        rideType: 'Go Luxury',
                        selected: selectedCar == 'car3',
                        onTap: () {
                          setState(() {
                            selectedCar = 'car3';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: 11,
                    ),
                    width: double.infinity,
                    child: ExprezonFilledButton(
                      text: 'continue'.tr,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String image;
  final bool selected;
  final String rideType;
  final String price;
  final VoidCallback onTap;

  const CarCard({super.key, 
    required this.image,
    required this.selected,
    required this.rideType,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: ExprezonSizes.width(context) / 3.5,
            height: ExprezonSizes.height(context) / 3.3,
            decoration: BoxDecoration(
              color:
                  selected ? const Color.fromARGB(255, 92, 158, 150) : Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ExprezonText(
                  rideType,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
                ExprezonText(
                  'Est. \$$price',
                  fontSize: 12,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            width: ExprezonSizes.width(context) / 4.5,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}
