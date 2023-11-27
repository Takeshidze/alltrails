import 'package:alltrails/modules/widgets/text.dart';
import 'package:flutter/material.dart';

final List<Map<String, IconData>> items = [
  {'wifi': Icons.wifi},
  {'beach': Icons.beach_access},
  {'bar': Icons.wine_bar},
  {'swimming_pool': Icons.pool},
  {'airport': Icons.local_airport},
  {'conditioner': Icons.air},
  {'dinner': Icons.dining_rounded},
];

IconData? getIconByType(String type) {
  for (var item in items) {
    if (item.containsKey(type)) {
      return item[type];
    }
  }
  return null;
}

class ServicesIcon extends StatelessWidget {
  final String type;
  final String title;
  final String decription;
  const ServicesIcon(
      {required this.type,
      super.key,
      required this.title,
      required this.decription});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        child: Icon(
          getIconByType(type),
          color: Colors.black,
        ),
      ),
      title: MyTextBox(
        textAlign: TextAlign.left,
        text: title,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      subtitle: MyTextBox(
        textAlign: TextAlign.left,
        text: decription,
        fontSize: 12,
      ),
    );
  }
}
