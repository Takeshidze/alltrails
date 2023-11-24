import 'package:alltrails/modules/screens/main_screens/home_screen/widgets/hot_toures_section.dart';
import 'package:alltrails/modules/screens/main_screens/home_screen/widgets/tour_card.dart';
import 'package:alltrails/modules/screens/main_screens/home_screen/widgets/where_to_where_form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Color.fromRGBO(71, 212, 245, 1),
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: sizeHeight * 0.05),
                  WhereToWhereForm(),
                  SizedBox(
                    height: sizeHeight * 0.05,
                  ),
                  HotTouresSection()
                ],
              )),
          Positioned(
            top: (sizeHeight * 0.05) * 2 + sizeHeight * 0.2 + sizeWidth * 0.3,
            child: Container(
              width: sizeWidth,
              height: sizeHeight * 0.17,
              child: Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return TourCard(
                        prise: 88321,
                        originalPrise: 95353,
                        arrivalPoint: "Турция",
                        hotelName: "Отель",
                        hotelStars: 3);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: sizeWidth * 0.1);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
