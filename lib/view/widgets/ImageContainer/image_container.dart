import 'dart:ui';

import '../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageContainerCustom extends StatelessWidget {
  final String? path;
  final String? title;
  final Function? onPress;
  const ImageContainerCustom({Key? key, this.path, this.title, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: InkWell(
        onTap: onPress as void Function()?,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: Container(
              alignment: Alignment.center,
              child: Column(children: [
                Expanded(flex: 4, child: SvgPicture.asset(path!)),
                Spacer(flex: 1),
                Expanded(
                    flex: 1,
                    child: Text(title!, style: TextStyle(color: Colors.white)))
              ]),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: context.colors.primaryVariant.withOpacity(0.2),
                    ),
                  ],
                  color: context.colors.primaryVariant,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      width: 1.5,
                      color: context.colors.primaryVariant.withOpacity(0.3))),
            ),
          ),
        ),
      ),
    );
  }
}
