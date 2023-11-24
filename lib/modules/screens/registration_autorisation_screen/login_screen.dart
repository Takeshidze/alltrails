import 'package:alltrails/modules/widgets/expended_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: sizeHeight * 0.1),
          Center(
            child: SizedBox(
              height: sizeHeight * 0.1,
              child: Image.asset('assets/images/Logo_alltrails.png'),
            ),
          ),
          SizedBox(height: sizeHeight * 0.1),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        final snackBar = SnackBar(
                          content: const Text('Введите логин!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(235, 235, 235, 1),
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(235, 235, 235, 1),
                            )),
                        hintText: "example@mail.ru",
                        filled: true,
                        fillColor: Color.fromRGBO(245, 245, 249, 1)),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.05,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        final snackBar = SnackBar(
                          content: const Text('Введите пароль!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        errorStyle:
                            TextStyle(fontSize: 12.0, color: Colors.red),
                        prefixIcon: Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(235, 235, 235, 1),
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(235, 235, 235, 1),
                            )),
                        hintText: "*********",
                        filled: true,
                        fillColor: Color.fromRGBO(245, 245, 249, 1)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: TextButton(
                              child: Text("Еще не зарегистрированны?"),
                              onPressed: () {
                                Navigator.of(context).pushNamed("/register/");
                              },
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Сообщение'),
                                    content: SingleChildScrollView(
                                        child:
                                            Text("Искренне вам сочуввствую")),
                                  );
                                },
                              );
                            },
                            child: Text("Забыли пароль?")),
                      ),
                    ],
                  ),
                  ExpendedButton(
                    text: "Войти",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed("/home/");
                      }
                    },
                  )
                ],
              ))
        ],
      ),
    )));
  }
}
