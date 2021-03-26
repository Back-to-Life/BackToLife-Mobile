import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageContainerCustom extends StatelessWidget {
  const ImageContainerCustom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: SvgPicture.asset(SVGImagePaths.instance.scanBarcode)),
            Spacer(flex: 1),
            Expanded(
              flex: 1,
              child: Text("name"),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: context.colors.primaryVariant,
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
