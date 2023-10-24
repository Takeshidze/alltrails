import 'package:flutter/material.dart';
import 'router/route.dart';
import 'themes/theme.dart';

class AllTrailAplication extends StatelessWidget {
  const AllTrailAplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light_theme,
      routes: route,
    );
  }
}
