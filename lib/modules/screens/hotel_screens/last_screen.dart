import 'package:alltrails/modules/widgets/text.dart';
import 'package:flutter/material.dart';

class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MyTextBox(
          text:
              'Спасибо за заказ, Менеджер тур оператора свяжется с вами в ближайшее время',
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
