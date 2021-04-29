/* import 'package:backtolife/core/constants/navigation/navigation_constants.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsArgumansWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final int selectedIndex;
  late NavigationService navigation = NavigationService.instance;
  SettingsArgumansWidget(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: context.height * 0.09,
        child: ListTile(
          onTap: selectedItem(selectedIndex),
          leading: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(imagePath)),
          title: Text('$title'),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ));
  }

  selectedItem(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        navigation.navigateToPage(path: NavigationConstants.LANGUAGE_SETTINGS);
        break;
      default:
    }
  }
}
 */