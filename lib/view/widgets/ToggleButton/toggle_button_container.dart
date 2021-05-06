import '../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class ToggleButtonContainer extends StatelessWidget {
  final bool? isSelected;
  final Function? callback;

  const ToggleButtonContainer({Key? key, this.isSelected, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: context.width * 0.2,
      height: context.height * 0.04,
      decoration: BoxDecoration(
          color: isSelected!
              ? context.colors.secondaryVariant.withOpacity(0.5)
              : context.colors.secondaryVariant,
          borderRadius: BorderRadius.circular(context.mediumValue),
          border: Border.all(
              width: 1.5,
              color: context.colors.secondaryVariant.withOpacity(0.3))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            curve: Curves.easeIn,
            top: 3.0,
            left: isSelected! ? 60.0 : 0.0,
            right: isSelected! ? 0.0 : 60.0,
            duration: const Duration(milliseconds: 500),
            child: InkWell(
              onTap: callback as void Function()?,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 5000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(child: child, turns: animation);
                },
                child: isSelected!
                    ? Icon(Icons.nights_stay_rounded,
                        color: Colors.black, key: UniqueKey())
                    : Icon(Icons.wb_sunny_rounded,
                        color: Colors.black, key: UniqueKey()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
