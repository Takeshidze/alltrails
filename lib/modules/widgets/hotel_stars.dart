import 'package:flutter/material.dart';

class HotelStars extends StatelessWidget {
  final int countStars;
  const HotelStars({super.key, required this.countStars});

  Widget getStars(countStars) {
    Widget widget;

    switch (countStars) {
      case 1:
        widget = Row(children: [Image.asset("assets/images/star.png")]);
        break;
      case 2:
        widget = Row(children: [
          Image.asset("assets/images/star.png"),
          Image.asset("assets/images/star.png")
        ]);
        break;
      case 3:
        widget = Row(children: [
          Image.asset("assets/images/star.png"),
          Image.asset("assets/images/star.png"),
          Image.asset("assets/images/star.png")
        ]);
        break;
      case 4:
        widget = Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Image.asset("assets/images/star.png"),
              Image.asset("assets/images/star.png"),
              Image.asset("assets/images/star.png")
            ]),
            Row(children: [Image.asset("assets/images/star.png")]),
          ],
        );
        break;
      case 5:
        widget = Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Image.asset("assets/images/star.png"),
              Image.asset("assets/images/star.png"),
              Image.asset("assets/images/star.png")
            ]),
            Row(children: [
              Image.asset("assets/images/star.png"),
              Image.asset("assets/images/star.png")
            ]),
          ],
        );
        break;
      default:
        widget = Row();
    }

    // Finally returning a Widget
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getStars(countStars),
    );
  }
}
