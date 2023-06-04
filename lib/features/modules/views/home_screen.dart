import 'package:exprezon/features/modules/model/drawer_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets.dart';
import '../../../constants/sizes.dart';
import '../../../helpers/navigator.dart';
import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';
import '../../../widgets/user_accounts_header.dart';
import 'car_selection_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : null,
        width: ExprezonSizes.width(context) / 1.2,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () => ExprezonNavigator.back(context),
                  icon: const Icon(Icons.arrow_back_ios)),
              const ExprezonUserAccountsWidget(),
              for (ExprezonDrawerButton drawerButton in exprezonDrawerButtons)
                Container(
                  // height: 30,
                  margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: ListTile(
                    leading: Icon(
                      drawerButton.icon,
                      // color: Colors.teal,
                    ),
                    onTap: () {
                      if (drawerButton.title == 'Home') {
                        ExprezonNavigator.back(context);
                      } else if (drawerButton.title == 'Settings') {
                        showSettings(context);
                      } else {
                        ExprezonNavigator.move(
                            drawerButton.page ??
                                Scaffold(
                                  appBar: AppBar(),
                                ),
                            context);
                      }
                    },
                    tileColor: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(255, 68, 68, 68)
                        : const Color.fromARGB(66, 63, 63, 63),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: ExprezonText(drawerButton.title),
                    // shape: ,
                  ),
                ),
              Center(child: ExprezonText('Exprezon © 2023'))
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: themeIndex != 1
              ? const Color.fromARGB(255, 7, 0, 0)
              : const Color.fromARGB(255, 252, 249, 249),
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: Theme.of(context).brightness == Brightness.dark ? .9 : .9,
            image: AssetImage(
              Theme.of(context).brightness == Brightness.dark
                  ? ExprezonImages.map
                  : ExprezonImages.map1,
            ),
          ),
        ),
        child: Column(
          children: [
            ExprezonStatusBar(),
            SizedBox(
              //  color: themeIndex == 1 ? Colors.transparent : Colors.teal,
              width: ExprezonSizes.width(context),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                        ),
                      );
                    }),
                    ExprezonText(
                      'BOOK YOUR RIDE',
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        showSettings(context);
                      },
                      icon: const Icon(
                        Icons.settings,
                      ),
                    )
                  ]),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              // height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal, width: 2),
                  color: themeIndex == 1
                      ? const Color.fromARGB(177, 22, 22, 22)
                      : const Color.fromARGB(87, 241, 238, 238),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    leading: const Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 3, 145, 112),
                    ),
                    title: ExprezonText(
                      '43 Wanpyak Street, Mangu, PL, 9ja',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    leading: const Icon(
                      Icons.navigation,
                      color: Color.fromARGB(255, 3, 145, 112),
                    ),
                    title: ExprezonText(
                      'COCIN LCC Tongsat, Mangu, PL, 9ja',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            for (var i = 0; i < 4; i++) const Spacer(),
            Container(
              margin: const EdgeInsets.all(15),
              // height: 150,
              decoration: BoxDecoration(
                  color: themeIndex == 1
                      ? const Color.fromARGB(177, 22, 22, 22)
                      : const Color.fromARGB(100, 241, 238, 238),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    leading: ExprezonText(
                      'Payment Mode',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    title: const SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          thickness: 1.5,
                          color: Colors.grey,
                        )),
                    trailing: ExprezonText(
                      'Wallet',
                      color: Colors.teal,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: 11,
                    ),
                    width: double.infinity,
                    child: ExprezonFilledButton(
                      text: 'continue'.tr,
                      onPressed: () {
                        ExprezonNavigator.move(const CarSelectionPage(), context);
                      },
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
