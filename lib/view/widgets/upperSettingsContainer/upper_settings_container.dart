import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class UpperContainerSettings extends StatelessWidget {
  final String title;
  const UpperContainerSettings({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.highOnlyBottomRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          decoration: BoxDecoration(
              color: context.colors.primaryVariant,
              borderRadius: context.highOnlyBottomRadius,
              border: Border.all(
                  width: 1.5,
                  color: context.colors.primaryVariant.withOpacity(0.3))),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: context.colors.surface),
                      onPressed: () => Navigator.pop(context))),
              Expanded(
                  flex: 3,
                  child: Text(title,
                      style: context.textTheme.headline5!
                          .copyWith(color: context.colors.surface))),
            ],
          ),
        ),
      ),
    );
  }
}
