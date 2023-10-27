import 'package:alltrails/modules/screens/main_screen/widgets/tour_card.dart';
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
      padding: EdgeInsets.all(10),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/fire.png",
                    fit: BoxFit.contain,
                  )
                ],
              ),
              Spacer()
            ],
          ),
          CarouselSlider(items: [
            TourCard(
              prise: 77342,
              originalPrise: 93342,
              hotelName: "AgonHotel",
              arrivalPoint: "Турция, Стамбул",
              hotelStars: 3,
            ),
            TourCard(
              prise: 77342,
              originalPrise: 93342,
              hotelName: "AgonHotel",
              arrivalPoint: "Турция, Стамбул",
              hotelStars: 3,
            ),
            TourCard(
              prise: 77342,
              originalPrise: 93342,
              hotelName: "AgonHotel",
              arrivalPoint: "Турция, Стамбул",
              hotelStars: 3,
            ),
          ], options: CarouselOptions()),
          SizedBox(
            height: sizeHeight * 0.01,
          ),
          ExpendedButton(
            text: "Выбрать самый жаркий",
            color: Color.fromRGBO(255, 85, 34, 1),
          )
        ],
      ),
    );
  }
}
