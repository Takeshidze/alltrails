import 'package:alltrails/alltrails_list_app.dart';
import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://hgflcwucjbsqrkjuqvvr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhnZmxjd3VjamJzcXJranVxdnZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA3OTA4NzgsImV4cCI6MjAxNjM2Njg3OH0.V1pVKF2Ng2ioVAf_AXLAQWn1z9fNlXy5z7Xm-S0ucRA',
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => SharedState(),
      child: AllTrailAplication(),
    ),
  );
}
