import 'package:backtolife/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SpaceSizedWidthBox extends StatelessWidget {
  final double width;

  const SpaceSizedWidthBox({Key? key, required this.width})
      : assert(width > 0 && width <= 1),
        super(key: key);
  @override
  Widget build(BuildContext context) => SizedBox(width: context.width * width);
}
