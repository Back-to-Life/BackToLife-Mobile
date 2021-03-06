import 'sized-box/space_sized_height_box.dart';
import 'sized-box/space_sized_width_box.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme.apply(fontFamily: 'Popins');
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingHoriZontal on BuildContext {
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension BorderExtension on BuildContext {
  BorderRadius get normalBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.05));
  BorderRadius get lowBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.02));
  BorderRadius get highBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.1));

  BorderRadius get normalOnlyBottomRadius =>
      BorderRadius.vertical(bottom: Radius.circular(width * 0.05));

  BorderRadius get lowOnlyBottomRadius =>
      BorderRadius.vertical(bottom: Radius.circular(width * 0.02));

  BorderRadius get highOnlyBottomRadius =>
      BorderRadius.vertical(bottom: Radius.circular(width * 0.1));

  RoundedRectangleBorder get roundedRectangleBorderLow =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(lowValue)));

  RoundedRectangleBorder get roundedRectangleAllBorderNormal =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(normalValue));

  RoundedRectangleBorder get roundedRectangleBorderNormal =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(normalValue)));

  RoundedRectangleBorder get roundedRectangleBorderMedium =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(mediumValue)));

  RoundedRectangleBorder get roundedRectangleBorderHigh =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(highValue)));

  RoundedRectangleBorder get bottomRectangleBorderNormal =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(normalValue)));

  RoundedRectangleBorder get bottomRectangleBorderMedium =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(mediumValue)));

  RoundedRectangleBorder get bottomRectangleBorderHigh =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(highValue)));
}

extension SizedBoxExtension on BuildContext {
  Widget get emptySizedWidthBoxLow => SpaceSizedWidthBox(width: 0.03);
  Widget get emptySizedWidthBoxLow3x => SpaceSizedWidthBox(width: 0.03);
  Widget get emptySizedWidthBoxNormal => SpaceSizedWidthBox(width: 0.53);
  Widget get emptySizedWidthBoxHigh => SpaceSizedWidthBox(width: 0.1);

  Widget get emptySizedHeightBoxLow => SpaceSizedHeightBox(height: 0.01);
  Widget get emptySizedHeightBoxLow3x => SpaceSizedHeightBox(height: 0.03);
  Widget get emptySizedHeightBoxNormal => SpaceSizedHeightBox(height: 0.05);
  Widget get emptySizedHeightBoxHigh => SpaceSizedHeightBox(height: 0.1);
}
