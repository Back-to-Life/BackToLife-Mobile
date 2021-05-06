import 'dart:ui';

import '../../../../../core/init/svgPath/image_path_svg.dart';
import '../../../../widgets/ToggleButton/toggle_button_container.dart';
import '../../../../widgets/ToggleButton/toggle_button_notifications_container.dart';
import '../../../../widgets/upperSettingsContainer/upper_settings_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../viewModel/notification_view_model.dart';

class NotificationsSettingsView extends StatelessWidget {
  const NotificationsSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationsViewModel>(
        viewModel: NotificationsViewModel(),
        onModelReady: (NotificationsViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, _viewModel) => Scaffold(
              body: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: UpperContainerSettings(
                          title: LocaleKeys.settings_notifications.tr())),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Spacer(),
                        Padding(
                          padding: context.paddingMedium,
                          child: Container(
                              height: context.height * 0.12,
                              padding: context.paddingNormal,
                              decoration: BoxDecoration(
                                  borderRadius: context.normalBorderRadius,
                                  color: Color(0xFFE0E1BE)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.transparent,
                                  child: SvgPicture.asset(SVGImagePaths
                                      .instance.notifacationsettingsview),
                                ),
                                title: Text(
                                    LocaleKeys.settings_pushnotification.tr()),
                                trailing: ToggleButtonNotificationContainer(
                                  callback: () {},
                                  isSelected: false,
                                ),
                              )),
                        ),
                        Padding(
                          padding: context.paddingMedium,
                          child: Container(
                              height: context.height * 0.12,
                              padding: context.paddingNormal,
                              decoration: BoxDecoration(
                                  borderRadius: context.normalBorderRadius,
                                  color: Color(0xFFE0E1BE)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.transparent,
                                  child: SvgPicture.asset(SVGImagePaths
                                      .instance.emailnotificationssettings),
                                ),
                                title: Text(
                                    LocaleKeys.settings_emailnotification.tr()),
                                trailing: ToggleButtonNotificationContainer(
                                  callback: () {},
                                  isSelected: false,
                                ),
                              )),
                        ),
                        Spacer(flex: 4),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

 
}
