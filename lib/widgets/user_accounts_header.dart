import 'package:exprezon/widgets/text.dart';
import 'package:flutter/material.dart';

class ExprezonUserAccountsWidget extends StatelessWidget {
  const ExprezonUserAccountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.teal
            : const Color.fromARGB(255, 178, 196, 194),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/users/user.png',
            width: 70,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExprezonText(
                'Wisdom Dauda',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              ExprezonText(
                '+234 814 6626 426',
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
              Container(
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.teal.shade600,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ExprezonText(
                      '4.0',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    const Icon(
                      Icons.star,
                      size: 10,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
