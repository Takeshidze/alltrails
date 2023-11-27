import 'package:alltrails/modules/functions/functions.dart';
import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
import 'package:alltrails/modules/widgets/hotel_stars.dart';
import 'package:alltrails/modules/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TourCard extends StatelessWidget {
  final void Function()? onTap;
  final int prise;
  final String arrivalCountry;
  final String arrivalCity;
  final String tourOperator;
  final String hotelName;
  final int hotelStars;
  final String departureDate;
  final String returnDate;

  const TourCard({
    required this.prise,
    required this.hotelName,
    required this.hotelStars,
    this.arrivalCountry = "Турция",
    this.arrivalCity = "Анталья",
    this.departureDate = "10-10-2023",
    this.returnDate = "17-10-2023",
    this.tourOperator = "",
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizeWidth * 0.8,
        height: sizeHeight * 0.17,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(0, 169, 233, 1),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 1),
                blurRadius: 4,
              )
            ]),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                prise.toString() + " ₽",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Container(
                child: Image.network(
                  tourOperator,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                arrivalCountry + ", " + arrivalCity,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Spacer(),
              Text(
                hotelName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              HotelStars(countStars: hotelStars)
            ],
          ),
          Spacer(),
          Row(
            children: [
              Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              MyTextBox(
                  text: convertDate(departureDate) +
                      " - " +
                      convertDate(returnDate),
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi,
                    color: Colors.white,
                  ),
                  MyTextBox(
                      text: "WIFI",
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(
                width: sizeWidth * 0.015,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.food_bank_outlined,
                    color: Colors.white,
                  ),
                  MyTextBox(
                      text: "HB",
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(
                width: sizeWidth * 0.015,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.beach_access,
                    color: Colors.white,
                  ),
                  MyTextBox(
                      text: "2",
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
