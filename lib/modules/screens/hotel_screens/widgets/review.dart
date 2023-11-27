import 'package:alltrails/modules/widgets/expended_button.dart';
import 'package:alltrails/modules/widgets/text.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://pixelbox.ru/wp-content/uploads/2021/03/ava-instagram-7.png"),
            ),
            title: Row(children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green),
                child: MyTextBox(
                  text: "9/10",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: sizeWidth * 0.05,
              ),
              MyTextBox(
                text: "Олег Я.",
                fontWeight: FontWeight.bold,
              )
            ]),
            subtitle: Text("купил(а) тур на 7 ночей"),
            trailing: Text("23.09.2023"),
          ),
          Container(
              height: 100,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(bounds);
                },
                child: Text(
                  "Я недавно посетил великолепный отель в Турции и хочу поделиться своим отзывом о нем. Этот отель действительно оправдал все мои ожидания и стал одним из самых запоминающихся мест, где мне довелось остановиться.С самого момента прибытия, отель поразил меня своим прекрасным расположением. Он находится прямо на берегу моря, и с каждым утром я просыпался под шелест волн и восхитительный вид на бескрайнюю голубую гладь. Это дарило неповторимую атмосферу спокойствия и релаксации, которую я искал в своем отпуске.", // Ваш текст
                  style: TextStyle(
                    color: Colors.black, // Цвет текста
                    fontSize: 16, // Размер шрифта
                  ),
                ),
              )),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(width: 2, color: Colors.blue), // Синий обвод
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white, // Прозрачный фон
                    ),
                  ),
                  child: Text(
                    "Посмотреть еще отзывы",
                    style: TextStyle(color: Colors.blue),
                  )))
        ],
      ),
    );
  }
}
