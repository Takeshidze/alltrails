import 'package:flutter/material.dart';

class TourCard extends StatelessWidget {
  const TourCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(0, 169, 233, 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 1),
            blurRadius: 4,
          )
        ]
      ),
      child: Column(children: [
        Row(children: [
          Text("73212 ₽",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
          ),
          Text("94212 ₽",
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16
          ),
          ),
          Image.asset("assets\images\logo_tour_operators\CoralTravel.png", fit: BoxFit.contain,)
        ],)
      ]),
    );
  }
}