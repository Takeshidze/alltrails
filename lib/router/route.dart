import 'package:alltrails/modules/screens/hotel_screens/hotel_room_screen.dart';
import 'package:alltrails/modules/screens/hotel_screens/hotel_screen.dart';
import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
import 'package:alltrails/modules/screens/main_screens/more_screen/more_screen.dart';
import 'package:alltrails/modules/screens/main_screens/more_screen/settings_screens/profile_screen/profile_screen.dart';
import 'package:alltrails/modules/screens/registration_autorisation_screen/login_screen.dart';
import 'package:alltrails/modules/screens/registration_autorisation_screen/register_screen.dart';

final route = {
  '/': (context) => MainScreen(),
  // '/cards/': (context) => HotelScreen(),
  '/login/': (context) => RegisterScreen(),
  '/home/': (context) => MainScreen(),
  // '/settings/': (context) => MoreScreen(),
  '/settings/profile/': (context) => ProfileScreen(),
};
