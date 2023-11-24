import 'package:alltrails/modules/screens/main_screens/layout_main_screen.dart';
import 'package:alltrails/modules/screens/main_screens/more_screen/settings_screens/profile_screen/profile_screen.dart';
import 'package:alltrails/modules/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});

  final List<Map<String, dynamic>> settings = [
    {'icon': Icons.person, 'text': 'Профиль', 'direction': "Profile"},
    {
      'icon': Icons.favorite,
      'text': 'Понравившиеся',
    },
    {
      'icon': Icons.history,
      'text': 'История просмотров',
    },
    {
      'icon': Icons.notifications,
      'text': 'Уведомления',
    },
    {
      'icon': Icons.security,
      'text': 'Безопасность',
    },
    {
      'icon': Icons.info,
      'text': 'О нас',
    }
    // Добавьте остальные настройки здесь
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: settings.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(settings[index]['icon'],
                color: Color.fromRGBO(0, 147, 208, 1)),
            title: MyTextBox(
                textAlign: TextAlign.start,
                text: settings[index]['text'],
                fontSize: 20,
                fontWeight: FontWeight.bold),
            trailing: Icon(Icons.arrow_forward,
                color: Color.fromRGBO(0, 147, 208, 1)),
            onTap: () {
              Provider.of<SharedState>(context, listen: false)
                  .updateData(settings[index]["direction"]);
            },
          );
        },
      ),
    );
  }
}
