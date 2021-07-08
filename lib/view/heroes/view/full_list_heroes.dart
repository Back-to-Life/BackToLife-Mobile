import 'dart:ui';

import 'package:avatars/avatars.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../viewModel/heroes_view_model.dart';
import '../../widgets/slideAnimation/slide_animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FullListHeroes extends StatefulWidget {
  const FullListHeroes({Key? key}) : super(key: key);

  @override
  _FullListHeroesState createState() => _FullListHeroesState();
}

class _FullListHeroesState extends State<FullListHeroes>
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
    return BaseView<HeroesViewModel>(
        viewModel: HeroesViewModel(),
        onModelReady: (HeroesViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, _viewModel) => Scaffold(
              body: Stack(
                children: [
                  Container(
                    height: context.height * 0.25,
                    child: ClipRRect(
                      borderRadius: context.highOnlyBottomRadius,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: context.colors.primaryVariant,
                              borderRadius: context.highOnlyBottomRadius,
                              border: Border.all(
                                  width: 1.5,
                                  color: context.colors.primaryVariant
                                      .withOpacity(0.3))),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      icon: Icon(Icons.arrow_back_ios,
                                          color: Colors.white),
                                      onPressed: () =>
                                          Navigator.pop(context, 'bar'))),
                              Expanded(
                                  flex: 3,
                                  child: Text('Heroes Of The World',
                                      style: context.textTheme.headline5!
                                          .copyWith(color: Colors.white))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: context.height * 0.18,
                        bottom: context.height * 0.03),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.height * 0.05),
                      child: Container(
                        alignment: Alignment.center,
                        width: context.width * 0.8,
                        height: context.height * 0.9,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: context.read<ThemeNotifier>().isDark
                                    ? Colors.white.withOpacity(0.6)
                                    : Color(0xFFE2DFDF).withOpacity(0.6),
                                blurRadius: 4,
                                offset: Offset(10, 10),
                              ),
                            ],
                            color: context.read<ThemeNotifier>().isDark
                                ? Color(0xFFE0E1BE)
                                : Color(0xFFFCFCEC),
                            borderRadius: context.highBorderRadius,
                            border: Border.all(
                                width: 1,
                                color: context.read<ThemeNotifier>().isDark
                                    ? Color(0xFF9C9D9C)
                                    : Color(0xFFE2DFDF))),
                        child: Observer(builder: (_) {
                          return _viewModel.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xFF4E5F49))))
                              : ListView.builder(
                                  itemCount: _viewModel.heroesName.length,
                                  itemBuilder: (context, index) {
                                    return SlideAnimation(
                                      itemCount: _viewModel.heroesName.length,
                                      position: index,
                                      slideDirection: SlideDirection.fromTop,
                                      animationController: _animationController,
                                      child: Column(
                                        children: [
                                          context.emptySizedHeightBoxLow,
                                          Padding(
                                            padding: context.paddingLow,
                                            child: ListTile(
                                              leading: Avatar(
                                                  shape: AvatarShape.circle(
                                                      context.mediumValue *
                                                          0.7),
                                                  placeholderColors: [
                                                    context
                                                        .colors.primaryVariant
                                                  ],
                                                  sources: [
                                                    NetworkSource(_viewModel
                                                        .heroesImageUrl[index])
                                                  ],
                                                  loader: Shimmer.fromColors(
                                                      child: CircleAvatar(
                                                          radius: context
                                                                  .mediumValue *
                                                              0.7),
                                                      baseColor:
                                                          Colors.grey[300]!,
                                                      highlightColor:
                                                          Colors.grey[100]!),
                                                  textStyle: TextStyle(
                                                      fontSize:
                                                          context.mediumValue)),
                                              /*    CircleAvatar(
                                                radius:
                                                    context.mediumValue * 0.7,
                                                backgroundImage: NetworkImage(
                                                    '${_viewModel.heroesImageUrl[index]}'),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ), */
                                              title: Text(
                                                _viewModel.heroesName[index],
                                                style: context
                                                    .textTheme.headline6!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF4E5F49)),
                                              ),
                                              trailing: Text(
                                                  ('+' +
                                                      _viewModel
                                                          .heroesPoint[index]
                                                          .toString()),
                                                  style: context
                                                      .textTheme.headline6!
                                                      .copyWith(
                                                          color: Color(
                                                              0xFFC4C0FF))),
                                            ),
                                          ),
                                          Divider(
                                              height: 1.5,
                                              color: Color(0xFFC4C6C3)),
                                          context.emptySizedHeightBoxLow,
                                        ],
                                      ),
                                    );
                                  });
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
