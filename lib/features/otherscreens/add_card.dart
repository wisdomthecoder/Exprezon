import 'package:exprezon/constants/sizes.dart';
import 'package:exprezon/features/modules/views/home_screen.dart';
import 'package:exprezon/widgets/filled_button.dart';
import 'package:exprezon/widgets/statusbar.dart';
import 'package:exprezon/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../helpers/setting_bottom_bar.dart';
import '../../widgets/credit_card.dart';

class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({super.key});

  @override
  _AddCreditCardScreenState createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  final FocusNode _cardNumberFocusNode = FocusNode();
  final FocusNode _expiryDateFocusNode = FocusNode();
  final FocusNode _cvvFocusNode = FocusNode();
  final TextEditingController _cardNumberController =
      TextEditingController(text: '1234 5678 9012 3456');
  final TextEditingController _expiryDateController =
      TextEditingController(text: '12/24');
  final TextEditingController _cvvController =
      TextEditingController(text: '123');

  @override
  void dispose() {
    _cardNumberFocusNode.dispose();
    _expiryDateFocusNode.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cvvFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExprezonStatusBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                color: Colors.teal,
                icon: const Icon(Icons.arrow_back_ios),
              ),
              ExprezonText('addmoneytowallet'.tr),
              IconButton(
                color: Colors.teal,
                onPressed: () => showSettings(context),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CreditCard(),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: _cardNumberController,
                      focusNode: _cardNumberFocusNode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        label: ExprezonText('cardnumber'.tr),
                        hintText: '**** **** **** ****',
                        prefixIcon: const Icon(Icons.credit_card),
                        suffixIcon: GestureDetector(
                            onTap: () => _cardNumberController.text = '',
                            child: const Icon(
                              Icons.clear,
                              color: Colors.black,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(17),
                        _CardNumberFormatter(),
                      ],
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(_expiryDateFocusNode);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: ExprezonSizes.width(context),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _expiryDateController,
                              focusNode: _expiryDateFocusNode,
                              keyboardType: TextInputType.datetime,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.calendar_today),
                                hintText: 'mm/yy',
                                label: ExprezonText('Exp. Date'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5)
                              ],
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(_cvvFocusNode);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _cvvController,
                              focusNode: _cvvFocusNode,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.security),
                                hintText: '***',
                                label: ExprezonText('CVV'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3)
                              ],
                              onEditingComplete: () {
                                _cvvFocusNode.unfocus();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ExprezonFilledButton(
                        text: 'Add Money',
                        onPressed: () {
                          Get.offAll(() => const HomeScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    var selectionIndex = newValue.selection.end;
    var formattedText = '';

    for (var i = 0; i < newText.length; i += 4) {
      final endIndex = i + 4;
      if (endIndex <= newText.length) {
        formattedText += '${newText.substring(i, endIndex)} ';
      } else {
        formattedText += newText.substring(i);
      }
      if (selectionIndex > i) {
        selectionIndex += 1;
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
