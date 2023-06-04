import 'package:exprezon/widgets/text.dart';
import 'package:flutter/cupertino.dart';

class ExprezonFilledButton extends StatelessWidget {
  String text;
  Function()? onPressed;
  ExprezonFilledButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: ExprezonText(
        text,
      ),
    );
  }
}
