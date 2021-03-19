import 'package:backtolife/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class OnBoardCircle extends StatelessWidget {
  final bool isSelected;
  final int index;

  const OnBoardCircle(
      {Key key, @required this.isSelected, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal * 0.3,
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        child: CircleAvatar(
          backgroundColor: index == 1
              ? context.colors.onBackground.withOpacity(isSelected ? 1 : 0.5)
              : context.colors.onSurface.withOpacity(isSelected ? 1 : 0.5),
          radius: isSelected ? context.width * 0.04 : context.width * 0.02,
        ),
      ),
    );
  }
}
