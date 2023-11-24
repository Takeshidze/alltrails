import 'package:alltrails/modules/widgets/expended_button.dart';
import 'package:alltrails/modules/widgets/text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> settings = [
  {'title': "Номер телефона", 'value': '+79774234212', 'type': 'text'},
  {'title': "Пол", 'value': 'Нет', 'type': 'gender'},
  {'title': "Email", 'value': 'example@yandex.ru', 'type': 'text'},
  {'title': "Дата рождения", 'value': '11/11/2023', 'type': 'date'},
];
String countryCode = "RU";

class SettingsListView extends StatefulWidget {
  const SettingsListView({super.key});

  @override
  State<SettingsListView> createState() => _SettingsListViewState();
}

class _SettingsListViewState extends State<SettingsListView> {
  late TextEditingController _textEditingController;

  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  void _updateSelectedValue(String newValue, index) {
    setState(() {
      settings[index]["value"] = newValue;
    });
  }

  void _updateSelectedDate(DateTime newValue, index) {
    setState(() {
      // how you want it to be formatted
      String string =
          '${newValue.day.toString().padLeft(2, '0')}/${newValue.month.toString().padLeft(2, '0')}/${newValue.year}'; // format it
      settings[index]["value"] = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextBox(
            text: "Личная информация",
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w500,
            color: Colors.blue),
        Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: settings.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (settings[index]['type'] == "text") {
                        showModalTextField(context, index);
                      } else if (settings[index]['type'] == "gender") {
                        showModalGenderField(context, index);
                      } else if (settings[index]['type'] == "date") {
                        _selectDate(context, index);
                      } else {
                        return;
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: MyTextBox(
                                textAlign: TextAlign.start,
                                text: settings[index]['title'],
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          MyTextBox(
                            text: settings[index]["value"],
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  );
                })),
        MyTextBox(
            text: "Другие сведения",
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w500,
            color: Colors.blue),
        Container(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: MyTextBox(
                        textAlign: TextAlign.start,
                        text: "Страна проживания",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  CountryCodePicker(
                    onChanged: (value) {
                      setState(() {
                        countryCode = value.code!;
                      });
                    },
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: countryCode,
                    // optional. Shows only country name and flag
                    showCountryOnly: true,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: true,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showModalTextField(BuildContext context, index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          TextEditingController _textEditingController =
              TextEditingController();
          _textEditingController.text = settings[index]["value"];

          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Новое значение',
                  ),
                ),
                SizedBox(height: 16.0),
                ExpendedButton(
                  text: "Сохранить",
                  onPressed: () {
                    setState(() {
                      settings[index]["value"] = _textEditingController.text;
                    });
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  void showModalGenderField(BuildContext context, index) {
    String? gender = settings[index]["value"];
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Выберите пол',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  RadioListTile<String>(
                    title: const Text('Мужской'),
                    value: 'Мужской',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Женский'),
                    value: 'Женский',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _updateSelectedValue(gender!, index);
                      });

                      Navigator.pop(
                          context); // Закрыть showModalBottomSheet и вернуть выбранное значение
                    },
                    child: Text('Сохранить'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, index) async {
    DateTime _selectedDate = DateTime.now();
    final DateTime? picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _updateSelectedDate(_selectedDate, index);
      });
  }
}
