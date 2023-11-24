import 'package:alltrails/modules/screens/registration_autorisation_screen/widgets/contract.dart';
import 'package:alltrails/modules/widgets/expended_button.dart';
import 'package:alltrails/modules/widgets/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase/supabase.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String _password;
  late String _confirmPassword;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _usernameValidator = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final _passwordValidator = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$');

  bool _isAccepted = false;

  final supabase = SupabaseClient('https://hgflcwucjbsqrkjuqvvr.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhnZmxjd3VjamJzcXJranVxdnZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA3OTA4NzgsImV4cCI6MjAxNjM2Njg3OH0.V1pVKF2Ng2ioVAf_AXLAQWn1z9fNlXy5z7Xm-S0ucRA');

  void _toggleAccept(bool? newValue) {
    setState(() {
      if (newValue != null) {
        _isAccepted = newValue;
      }
    });
  }

  bool is_submit_contract() {
    if (!_isAccepted) {
      final snackBar = SnackBar(
        content: const Text('вы не приняли соглашение '),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return true;
  }

  void initState() {
    _password = '';
    _confirmPassword = '';
    super.initState();
  }

  Future<void> insertUser(String email, String password) async {
    final response = await supabase
        .from('users')
        .insert({'email': email, 'password': password}).execute();

    if (response.status == 200) {
      print('Пользователь успешно добавлен');
    } else {
      print('Ошибка при добавлении пользователя: ${response.status}');
    }
  }

  void createNewUser() async {
    final checkResponse = await supabase
        .from('Users')
        .select()
        .eq('email', _usernameController.text)
        // ignore: deprecated_member_use
        .execute();

    if (checkResponse.status != 200) {
      Fluttertoast.showToast(
        msg: "Ошибка при выполнении запроса",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    } else if (checkResponse.data.isNotEmpty) {
      Fluttertoast.showToast(
        msg: "Почта уже используется",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: sizeHeight * 0.05),
            Center(
              child: SizedBox(
                height: sizeHeight * 0.1,
                child: Image.asset('assets/images/Logo_alltrails.png'),
              ),
            ),
            SizedBox(height: sizeHeight * 0.05),
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
                        } else if (!_usernameValidator.hasMatch(value)) {
                          final snackBar = SnackBar(
                            content: const Text('Неккоректный логин'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(235, 235, 235, 1),
                              )),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                        } else if (!_passwordValidator.hasMatch(value)) {
                          final snackBar = SnackBar(
                              content: const Text(
                                  "'Пароль должен содержать как минимум одну заглавную букву, одну строчную букву, одну цифру и один специальный символ. Длина должна быть от 8 до 20 символов.'"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _password = value!;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          errorStyle:
                              TextStyle(fontSize: 12.0, color: Colors.red),
                          prefixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(235, 235, 235, 1),
                              )),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(235, 235, 235, 1),
                              )),
                          hintText: "*********",
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
                            content: const Text('Подтвердите пароль'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (value != _password) {
                          final snackBar = SnackBar(
                            content: const Text("Пароли не совпадают"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _confirmPassword = value!;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          errorStyle:
                              TextStyle(fontSize: 12.0, color: Colors.red),
                          prefixIcon: Icon(Icons.lock_reset),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(235, 235, 235, 1),
                              )),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(235, 235, 235, 1),
                              )),
                          hintText: "*********",
                          filled: true,
                          fillColor: Color.fromRGBO(245, 245, 249, 1)),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.05,
                    ),
                    CheckboxListTile(
                      title: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Я принимаю условия ',
                            ),
                            TextSpan(
                                text: 'соглашения',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _showAgreementDialog();
                                  }),
                            TextSpan(
                              text: '.',
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                      value: _isAccepted,
                      onChanged: _toggleAccept,
                    ),
                    ExpendedButton(
                      text: "Зарегистрироваться",
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate() &&
                            is_submit_contract()) {
                          if (_password == _confirmPassword) {
                            Navigator.of(context).pushNamed("/");
                          } else {
                            final snackBar = SnackBar(
                              content: const Text("Пароли не совпадают"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
    )));
  }

  void _showAgreementDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Лицензионное соглашение'),
          content: SingleChildScrollView(child: Text(contract)),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Принять'),
              onPressed: () {
                setState(() {
                  _isAccepted = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
