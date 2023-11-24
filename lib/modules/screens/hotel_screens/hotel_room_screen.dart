import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
import 'package:alltrails/modules/widgets/expended_button.dart';
import 'package:alltrails/modules/widgets/hotel_stars.dart';
import 'package:alltrails/modules/widgets/text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<String> imagesList = [
  'https://tez-travel.com/workdir/hotels/01_5556.jpg',
  'https://tez-moscow.ru/images/hotels/gallery/614964/0-0_70441621463627.jpg',
  'https://tez-moscow.ru/images/hotels/gallery/614964/0-0_52901621463631.jpg',
  'https://travel-picture.ru/wp-content/uploads/2019/01/agon.jpg',
];

class HotelRoomScreen extends StatelessWidget {
  const HotelRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                MyTextBox(
                  text: "Призиденский люкс с видом на море",
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  fontSize: 20,
                ),
              ]),
            ),
            CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return Image.network(imagesList[index]);
                },
                options: CarouselOptions(
                  animateToClosest: true,
                  aspectRatio:
                      4 / 3, // Замените на нужное вам соотношение сторон
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                MyTextBox(
                  text:
                      "Просторный номер с элегантным дизайном и уютной обстановкой. В номере имеется удобная кровать king-size, отдельная гостиная зона, современная ванная комната с джакузи и отдельным душем. Панорамные окна открывают потрясающий вид на город или море. Гости могут пользоваться мини-баром и кофейным аппаратом. Бесплатный Wi-Fi, телевизор с плоским экраном и обслуживание номеров делают пребывание максимально комфортным.",
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(
                  height: sizeHeight * 0.05,
                ),
                ExpendedButton(
                  onPressed: () {
                    Provider.of<SharedState>(context, listen: false)
                        .updateData("Last Screen");
                  },
                  text: "Забронировать",
                  color: Colors.amber,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
