import 'package:alltrails/modules/screens/hotel_screens/hotel_screen.dart';
import 'package:alltrails/modules/screens/main_screens/home_screen/widgets/hot_toures_section.dart';
import 'package:alltrails/modules/screens/main_screens/home_screen/widgets/tour_card.dart';
import 'package:alltrails/modules/screens/main_screens/home_screen/widgets/where_to_where_form.dart';
import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as normal_provider;

class HomeScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const HomeScreen(
      {super.key, required GlobalKey<NavigatorState> this.navigatorKey});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final supabase = Supabase.instance.client;
  List<dynamic> tours = [];
  Future<void> GetTours() async {
    final response =
        await supabase.from('Tours').select('*, Hotels(*)').execute();
    if (response.status == 200 && response.data.length > 0) {
      setState(() {
        tours = response.data;
      });
    } else {
      // ignore: avoid_print
      print('Error fetching user role');
    }
  }

  @override
  void initState() {
    super.initState();
    GetTours();
  }

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
                  itemCount: tours.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TourCard(
                      prise: tours[index]['cost'],
                      tourOperator: tours[index]['tour_operator_img_link'],
                      departureDate: tours[index]['start_date'],
                      returnDate: tours[index]['end_date'],
                      arrivalCountry: tours[index]['Hotels']['country'],
                      arrivalCity: tours[index]['Hotels']['city'],
                      hotelName: tours[index]['Hotels']['name'],
                      hotelStars: tours[index]['Hotels']['stars'],
                      onTap: () {
                        widget.navigatorKey.currentState!
                            .push(MaterialPageRoute(
                          builder: (context) => HotelScreen(
                              argument: tours[index]['Hotels']['id']),
                        ));
                      },
                    );
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
