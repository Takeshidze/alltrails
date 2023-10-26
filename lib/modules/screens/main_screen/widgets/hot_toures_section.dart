import 'package:alltrails/modules/screens/main_screen/widgets/tour_card.dart';
import 'package:flutter/material.dart';

class HotTouresSection extends StatelessWidget {
  const HotTouresSection({super.key});

  @override
  Widget build(BuildContext context) {
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
        ]
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Text(
                  "Горячие туры",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Скоро разберут!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Image.asset("assets/images/fire.png", fit: BoxFit.contain,)
              ],),
              Spacer()
            ],
          ),
          Row(
            children: [
              TourCard()
            ],
          )
        ],
      ),
    );
  }
}