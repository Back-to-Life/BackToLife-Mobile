import '../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class ToggleButtonNotificationContainer extends StatelessWidget {
  final bool? isSelected;
  final Function? callback;

  const ToggleButtonNotificationContainer(
      {Key? key, this.isSelected, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Expanded(
          flex: 3,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: context.width * 0.18,
            height: context.height * 0.04,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(context.mediumValue)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  curve: Curves.easeIn,
                  top: 3.0,
                  left: isSelected! ? 40.0 : 0.0,
                  right: isSelected! ? 0.0 : 40.0,
                  duration: const Duration(milliseconds: 500),
                  child: InkWell(
                    onTap: callback as void Function()?,
                    child: Padding(
                      padding: context.paddingLowHorizontal,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 5000),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return RotationTransition(
                              child: child, turns: animation);
                        },
                        child: isSelected!
                            ? Icon(Icons.check,
                                color: Color(0xFFE0E1BE), key: UniqueKey())
                            : Icon(Icons.close,
                                color: Color(0xFFE0E1BE), key: UniqueKey()),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
