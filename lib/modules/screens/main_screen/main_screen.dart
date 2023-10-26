import 'package:alltrails/modules/screens/main_screen/widgets/hot_toures_section.dart';
import 'package:alltrails/modules/screens/main_screen/widgets/where_to_where_form.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              color: Colors.amber,
              height: sizeHeight * 0.05,
              child: Center(child: Image.asset("assets/images/Logo_alltrails.png", fit: BoxFit.contain)),
            ),
            SizedBox(height: sizeHeight * 0.05),
            WhereToWhereForm(),
            SizedBox(height: sizeHeight* 0.05,),
            HotTouresSection()
          ],)
        ),
    ));
  }
}