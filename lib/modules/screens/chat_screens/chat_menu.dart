import 'package:alltrails/modules/widgets/text.dart';
import 'package:flutter/material.dart';

class Chat {
  final String name;
  final String lastMessage;
  final String avatar;

  Chat({required this.name, required this.lastMessage, required this.avatar});
}

final List<Chat> chats = [
  Chat(
    name: 'Иван',
    lastMessage: 'Привет, как дела?',
    avatar:
        'https://pixelbox.ru/wp-content/uploads/2021/03/ava-instagram-7.png',
  ),
  Chat(
    name: 'Мария',
    lastMessage: 'Сегодня встреча?',
    avatar: 'https://telegra.ph/file/13f80fdaa3009ad466c2d.png',
  ),
  // Добавьте другие чаты с их аватарками
];

class ChatMenu extends StatelessWidget {
  const ChatMenu({super.key, required GlobalKey<NavigatorState> navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: chats.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chats[index].avatar),
                  ),
                  title: MyTextBox(
                    textAlign: TextAlign.start,
                    text: chats[index].name,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  subtitle: Text(chats[index].lastMessage),
                ),
              );
            }),
          ),
        ));
  }
}
