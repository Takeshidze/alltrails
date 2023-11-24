import 'package:flutter/material.dart';

class WhereToWhereTextField extends StatelessWidget {
  final String hintText;
  const WhereToWhereTextField({
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          border: InputBorder.none),
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class WhereToWhereForm extends StatelessWidget {
  const WhereToWhereForm({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sizeHeight * 0.2,
      padding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
            )
          ]),
      child: const Form(
          child: Column(
        children: [
          WhereToWhereTextField(hintText: "Откуда"),
          Divider(
            color: Colors.black,
          ),
          WhereToWhereTextField(
            hintText: "Куда",
          )
        ],
      )),
    );
  }
}
