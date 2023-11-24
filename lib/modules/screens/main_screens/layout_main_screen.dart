import 'package:alltrails/modules/screens/hotel_screens/hotel_room_screen.dart';
import 'package:alltrails/modules/screens/hotel_screens/hotel_screen.dart';
import 'package:alltrails/modules/screens/hotel_screens/last_screen.dart';
import 'package:alltrails/modules/screens/main_screens/home_screen/home_screen.dart';
import 'package:alltrails/modules/screens/main_screens/more_screen/more_screen.dart';
import 'package:alltrails/modules/screens/main_screens/more_screen/settings_screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SharedState with ChangeNotifier {
  String data = 'Home';

  void updateData(String newData) {
    data = newData;
    notifyListeners();
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<String> _children = ["Home", "Search", "Chat", "More"];

  Color _getIconColor(int index) {
    return index == _selectedIndex ? Colors.blue : Colors.grey;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Provider.of<SharedState>(context, listen: false)
          .updateData(_children[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: sizeHeight * 0.05,
          child: Image.asset(
              'assets/images/Logo_alltrails.png'), // Путь к вашему логотипу
        ),
        centerTitle: true, // Для центрирования заголовка
      ),
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              // Здесь вы можете определить различные экраны, которые вы хотите показать в зависимости от состояния вашего приложения
              // Например, можно использовать условные операторы для выбора, какой виджет отобразить в зависимости от какого-либо состояния
              if (Provider.of<SharedState>(context).data == 'Home') {
                return HomeScreen();
              } else if ((Provider.of<SharedState>(context).data == 'More')) {
                return MoreScreen();
              } else if ((Provider.of<SharedState>(context).data ==
                  'Profile')) {
                return ProfileScreen();
              } else if ((Provider.of<SharedState>(context).data == 'Card')) {
                return HotelScreen();
              } else if ((Provider.of<SharedState>(context).data ==
                  'Hotel Room Card')) {
                return HotelRoomScreen();
              } else if ((Provider.of<SharedState>(context).data ==
                  'Last Screen')) {
                return LastScreen();
              } else if ((Provider.of<SharedState>(context).data == 'Chat')) {
                return LastScreen();
              }
              return Placeholder();
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _getIconColor(0)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: _getIconColor(1)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble, color: _getIconColor(2)),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: _getIconColor(3)),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false, // скрывает подписи для выбранных элементов
        showUnselectedLabels: false,
      ),
    ));
  }
}
