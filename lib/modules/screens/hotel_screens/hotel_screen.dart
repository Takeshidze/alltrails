import 'package:alltrails/modules/screens/hotel_screens/widgets/map_viewer.dart';
import 'package:alltrails/modules/screens/hotel_screens/widgets/review.dart';
import 'package:alltrails/modules/screens/hotel_screens/widgets/services_icon.dart';
import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
import 'package:alltrails/modules/widgets/hotel_stars.dart';
import 'package:alltrails/modules/widgets/text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CombinedResults {
  final Map<String, dynamic> result1;
  final List<dynamic> result2;
  final List<dynamic> result3;
  CombinedResults(this.result1, this.result2, this.result3);
}

class HotelScreen extends StatefulWidget {
  final int argument;
  HotelScreen({super.key, required this.argument});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> fetchData1() async {
    final response = await supabase
        .from('Hotels')
        .select('*')
        .eq('id', widget.argument)
        .single()
        .execute();
    if (response.status == 200) {
      // Возвращаем данные, если запрос выполнен успешно

      return response.data;
    } else {
      // Обрабатываем ошибку, если запрос завершился неудачно
      throw response.status;
    }
  }

  Future<List<dynamic>> fetchData2() async {
    final data = await supabase
        .from('Services')
        .select('*, Service_types(*)')
        .eq('hotel_id', widget.argument)
        .execute();
    if (data.status == 200 && data.data.length > 0) {
      return data.data;
    } else {
      throw data.status;
    }
  }

  Future<List<dynamic>> fetchData3() async {
    final data = await supabase
        .from('Hotel_images')
        .select('*')
        .eq('hotel_id', widget.argument)
        .execute();
    if (data.status == 200 && data.data.length > 0) {
      return data.data;
    } else {
      throw data.status;
    }
  }

  Future<CombinedResults> fetchCombinedData() async {
    Map<String, dynamic> result1 = await fetchData1();
    List<dynamic> result2 = await fetchData2();
    List<dynamic> result3 = await fetchData3();
    return CombinedResults(result1, result2, result3);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCombinedData();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<CombinedResults>(
        future: fetchCombinedData(),
        builder: (context, AsyncSnapshot<CombinedResults> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Показываем индикатор загрузки, пока ждем результатов
          } else if (snapshot.hasError) {
            return Text(
                'Ошибка: ${snapshot.error}'); // Выводим ошибку, если произошла
          } else if (snapshot.hasData) {
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
                            HotelStars(
                                countStars:
                                    snapshot.data?.result1['stars'] ?? 3),
                            MyTextBox(
                                text:
                                    (snapshot.data?.result1['country'] ?? " ") +
                                        ", " +
                                        (snapshot.data?.result1['city'] ?? " "),
                                fontWeight: FontWeight.bold)
                          ]),
                          SizedBox(
                            height: sizeHeight * 0.01,
                          ),
                          Row(
                            children: [
                              MyTextBox(
                                text: snapshot.data?.result1['name'] ?? " ",
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
                            text: snapshot.data?.result1['description'] ?? " ",
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                    CarouselSlider.builder(
                        itemCount: snapshot.data?.result3.length,
                        itemBuilder: (context, index, realIndex) {
                          return Image.network(
                              snapshot.data?.result3[index]["image_link"]);
                        },
                        options: CarouselOptions(
                          animateToClosest: true,
                          aspectRatio: 4 /
                              3, // Замените на нужное вам соотношение сторон
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                        )),

                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.result2.length,
                            itemBuilder: (context, index) {
                              return ServicesIcon(
                                  type: snapshot.data?.result2[index]
                                      ['Service_types']['name'],
                                  title: snapshot.data?.result2[index]['title'],
                                  decription: snapshot.data?.result2[index]
                                      ['description']);
                            },
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Review(),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          MyTextBox(
                            text: "Расположение",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                              width: sizeWidth,
                              height: 400,
                              child: MapViewer(
                                  latitude: snapshot
                                      .data?.result1['location_latitude'],
                                  longitude: snapshot
                                      .data?.result1['location_longitude'])),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          MyTextBox(
                            text: "Информация об отеле",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          SizedBox(height: 10),
                          Text(
                            snapshot.data?.result1['history_hotel'] ?? " ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                    // Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Column(
                    //     children: [
                    //       GridView.count(
                    //         physics: ClampingScrollPhysics(),
                    //         shrinkWrap: true,
                    //         childAspectRatio: 9 / 11,
                    //         crossAxisCount: 2,
                    //         children: List.generate(6, (index) {
                    //           return Card(
                    //             elevation: 4.0,
                    //             shadowColor: Colors.blue,
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(12.0),
                    //             ),
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(2.0),
                    //               child: Column(
                    //                 children: <Widget>[
                    //                   ClipRRect(
                    //                       borderRadius: BorderRadius.circular(15.0),
                    //                       child: Image.network(
                    //                         'https://tez-travel.com/workdir/hotels/01_5556.jpg',
                    //                         fit: BoxFit.cover,
                    //                       )), // Пример URL изображения
                    //                   Padding(
                    //                     padding: const EdgeInsets.all(8.0),
                    //                     child: Text(
                    //                       'Надпись на карточке $index',
                    //                       style: TextStyle(fontSize: 12.0),
                    //                     ),
                    //                   ),
                    //                   Padding(
                    //                     padding:
                    //                         const EdgeInsets.symmetric(horizontal: 8.0),
                    //                     child: ElevatedButton(
                    //                         style: ButtonStyle(
                    //                             backgroundColor:
                    //                                 MaterialStatePropertyAll(
                    //                                     Colors.amber)),
                    //                         onPressed: () {
                    //                           Provider.of<SharedState>(context,
                    //                                   listen: false)
                    //                               .updateData("Hotel Room Card");
                    //                         },
                    //                         child: Row(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.spaceBetween,
                    //                           children: [
                    //                             Text("12003 Р"),
                    //                             Icon(Icons.arrow_forward)
                    //                           ],
                    //                         )),
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //           );
                    //         }),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text("Нет данных"),
            );
          }
        });
  }
}
