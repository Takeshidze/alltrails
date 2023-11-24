import 'package:alltrails/modules/screens/main_screens/more_screen/settings_screens/profile_screen/widgets/avatar_selector.dart';
import 'package:alltrails/modules/screens/main_screens/more_screen/settings_screens/profile_screen/widgets/settings_list_view.dart';
import 'package:alltrails/modules/screens/main_screens/more_screen/settings_screens/profile_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: sizeWidth * 0.5,
                  child: Column(
                    children: [
                      MyTextfield(hintText: "Имя"),
                      MyTextfield(hintText: "Фамилия")
                    ],
                  ),
                ),
                Spacer(),
                AvatarSelector()
              ],
            ),
            SettingsListView()
          ],
        ),
      ),
    );
  }
}
