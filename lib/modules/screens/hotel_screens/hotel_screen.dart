import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
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

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

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
              child: Column(
                children: [
                  Row(children: [
                    HotelStars(countStars: 3),
                    MyTextBox(
                        text: "Стамбул, Турция", fontWeight: FontWeight.bold)
                  ]),
                  SizedBox(
                    height: sizeHeight * 0.01,
                  ),
                  Row(
                    children: [
                      MyTextBox(
                        text: "Agon Hotel",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      Spacer(),
                      Icon(Icons.favorite)
                    ],
                  ),
                  SizedBox(
                    height: sizeHeight * 0.01,
                  ),
                  MyTextBox(
                    text:
                        "Уютный отель для курортного отдыха. Гостей ждут эргономичные номера и пляж в пяти минутах хотьбы.",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  )
                ],
              ),
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
              child: Column(
                children: [
                  GridView.count(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 9 / 11,
                    crossAxisCount: 2,
                    children: List.generate(6, (index) {
                      return Card(
                        elevation: 4.0,
                        shadowColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    'https://tez-travel.com/workdir/hotels/01_5556.jpg',
                                    fit: BoxFit.cover,
                                  )), // Пример URL изображения
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Надпись на карточке $index',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.amber)),
                                    onPressed: () {
                                      Provider.of<SharedState>(context,
                                              listen: false)
                                          .updateData("Hotel Room Card");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("12003 Р"),
                                        Icon(Icons.arrow_forward)
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
