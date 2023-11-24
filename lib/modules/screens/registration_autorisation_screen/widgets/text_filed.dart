import 'package:alltrails/modules/widgets/expended_button.dart';
import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  const TextField({super.key});

  @override
  State<TextField> createState() => _TextFieldState();
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class _TextFieldState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      validator: (input) {
        if (input!.isValidEmail()) {}
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Color.fromRGBO(235, 235, 235, 1),
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Color.fromRGBO(235, 235, 235, 1),
              )),
          hintText: "example@mail.ru",
          filled: true,
          fillColor: Color.fromRGBO(245, 245, 249, 1)),
    );
  }
}
