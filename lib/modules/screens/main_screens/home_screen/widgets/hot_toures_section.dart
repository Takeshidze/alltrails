import 'package:alltrails/modules/screens/main_screens/home_screen/widgets/tour_card.dart';
import 'package:alltrails/modules/widgets/expended_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HotTouresSection extends StatelessWidget {
  const HotTouresSection({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      height: sizeHeight * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
            )
          ]),
      child: Column(
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Горячие туры",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Скоро разберут!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacer(),
              Container(
                width: sizeWidth * 0.3,
                height: sizeWidth * 0.3,
                child: Image.asset(
                  "assets/images/fire.png",
                  fit: BoxFit.contain,
                ),
              ),
              Spacer()
            ],
          ),
          Spacer(),
          ExpendedButton(
            text: "Выбрать самый жаркий",
            color: Color.fromRGBO(255, 85, 34, 1),
          )
        ],
      ),
    );
  }
}
