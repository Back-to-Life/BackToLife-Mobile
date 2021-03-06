import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../../widgets/slideAnimation/slide_animation_list.dart';
import '../viewModel/settings_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onModelReady: (SettingsViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, _viewModel) => Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: context.colors.primaryVariant,
                            borderRadius: context.highOnlyBottomRadius),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    })),
                            Expanded(
                                flex: 3,
                                child: Text(LocaleKeys.settings_settings.tr(),
                                    style: context.textTheme.headline5!
                                        .copyWith(color: Colors.white))),
                            Expanded(
                                flex: 4,
                                child: SvgPicture.asset(
                                    SVGImagePaths.instance.settingsHeader))
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 7,
                    child: _buildListViewBuilder(_viewModel),
                  ),
                ],
              ),
            ));
  }

  ListView _buildListViewBuilder(SettingsViewModel _viewModel) {
    return ListView.builder(
      itemCount: _viewModel.settingArgumans.length,
      itemBuilder: (context, _position) {
        return SlideAnimation(
          itemCount: _viewModel.settingArgumans.length,
          position: _position,
          slideDirection: SlideDirection.fromTop,
          animationController: _animationController,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: context.height * 0.09,
                  child: ListTile(
                    onTap: () => _viewModel.selectedItem(_position),
                    leading: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                            _viewModel.settingArgumans[_position].imagePath)),
                    title: Text(
                      _viewModel.settingArgumans[_position].title,
                      style: context.textTheme.bodyText1!.copyWith(
                          color: context.colors.surface, fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: context.colors.surface,
                    ),
                  )),
              Divider(height: 10, color: context.colors.surface),
            ],
          ),
        );
      },
    );
  }
}
