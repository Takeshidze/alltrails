import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Logo_alltrails.png"),
            SizedBox(
              height: sizeHeight * 0.1,
            ),
            Container(
              width: sizeWidth * 0.2,
              height: sizeWidth * 0.2,
              child: CircularProgressIndicator(
                strokeWidth: sizeWidth / 75,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          ],
        )),
      ),
    ));
  }
}
