import 'package:alltrails/modules/widgets/text.dart';
import 'package:flutter/material.dart';

class ExpendedButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  const ExpendedButton(
      {required this.text,
      this.color = const Color.fromRGBO(26, 111, 238, 1),
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.only(top: 18, bottom: 18)),
              backgroundColor: MaterialStatePropertyAll(color)),
          child: MyTextBox(
            text: text,
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
