import 'package:backtolife/core/base/view/base_view.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/init/svgPath/image_path_svg.dart';
import 'package:backtolife/view/settings/viewModel/settings_view_model.dart';
import 'package:backtolife/view/widgets/settingsArgumans/settings_argumans.dart';
import 'package:backtolife/view/widgets/slideAnimation/slide_animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                                    onPressed: () {})),
                            Expanded(
                                flex: 3,
                                child: Text('Setting',
                                    style: context.textTheme.headline5!
                                        .copyWith(
                                            color: context.colors.surface))),
                            Expanded(
                                flex: 4,
                                child: SvgPicture.asset(
                                    SVGImagePaths.instance.settingsHeader))
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 7,
                    child: ListView.builder(
                      itemCount: _viewModel.settingArgumans.length,
                      itemBuilder: (context, _position) {
                        return SlideAnimation(
                          itemCount: _viewModel.settingArgumans.length,
                          position: _position,
                          slideDirection: SlideDirection.fromTop,
                          animationController: _animationController,
                          child: Column(
                            children: [
                              SettingsArgumansWidget(
                                  title: _viewModel
                                      .settingArgumans[_position].title,
                                  imagePath: SVGImagePaths.instance.arrowRight),
                              Divider(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
