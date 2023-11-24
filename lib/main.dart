import 'package:alltrails/alltrails_list_app.dart';
import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SharedState(),
      child: AllTrailAplication(),
    ),
  );
}
