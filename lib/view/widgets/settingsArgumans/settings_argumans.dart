import 'package:flutter/material.dart';

class SettingsArgumansWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  const SettingsArgumansWidget(
      {Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ListTile(
          leading: CircleAvatar(),
          title: Text('$title'),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ));
  }
}
