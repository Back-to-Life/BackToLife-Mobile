import 'dart:ui';

import 'package:backtolife/core/base/view/base_view.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/init/svgPath/image_path_svg.dart';
import 'package:backtolife/view/heroes/viewModel/heroes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeroesView extends StatelessWidget {
  const HeroesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HeroesViewModel>(
        viewModel: HeroesViewModel(),
        onModelReady: (HeroesViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, _viewModel) => Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        _heroesOfWorldText(context),
                        _heroesSvgImage(context),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: context.width * 0.05,
                            child: Container(
                              height: context.height * 0.4,
                              width: context.width * 0.8,
                              decoration: BoxDecoration(
                                  color: Color(0xFFD0E07A),
                                  borderRadius: context.highBorderRadius),
                            ),
                          ),
                          Positioned(
                            bottom: context.height * 0.06,
                            left: context.width * 0.09,
                            child: Container(
                              height: context.height * 0.4,
                              width: context.width * 0.8,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFCFCEC),
                                  borderRadius: context.highBorderRadius,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 4,
                                      offset: Offset(4, 8),
                                    ),
                                  ],
                                  border: Border.all(
                                      width: 1, color: Color(0xFFE2DFDF))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text('Top 3 Heroes',
                                            style: context.textTheme.headline6!
                                                .copyWith(
                                                    color: context
                                                        .colors.secondary)),
                                      )),
                                  Expanded(
                                    flex: 4,
                                    child: ListView.builder(
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              context.emptySizedHeightBoxLow,
                                              ListTile(
                                                leading: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      'https://picsum.photos/200/300'),
                                                ),
                                                title: Text(
                                                  'dada',
                                                  style: context
                                                      .textTheme.headline6!
                                                      .copyWith(
                                                          fontSize: 14,
                                                          color: context.colors
                                                              .secondary),
                                                ),
                                                trailing: Text('+100p',
                                                    style: context
                                                        .textTheme.headline6!
                                                        .copyWith(
                                                            color: Color(
                                                                0xFFC4C0FF))),
                                              ),
                                              Divider(
                                                  height: 1.5,
                                                  color: Color(0xFFC4C6C3)),
                                              context.emptySizedHeightBoxLow,
                                            ],
                                          );
                                        }),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          print('okey');
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Full List ',
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                      color: context
                                                          .colors.secondary),
                                              textAlign: TextAlign.end,
                                            ),
                                            Icon(Icons.arrow_forward_ios,
                                                size: 13,
                                                color:
                                                    context.colors.secondary),
                                            context.emptySizedWidthBoxLow3x
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ));
  }

  Positioned _heroesSvgImage(BuildContext context) {
    return Positioned.fill(
        top: 0,
        child: Padding(
          padding: EdgeInsets.only(bottom: context.highValue),
          child: SvgPicture.asset(SVGImagePaths.instance.heroesofworld),
        ));
  }

  Positioned _heroesOfWorldText(BuildContext context) {
    return Positioned(
      width: context.width * 1,
      bottom: context.height * 0.03,
      height: context.height * 0.12,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            // width: double.infinity,
            decoration: BoxDecoration(
                color: context.colors.primaryVariant,
                border: Border.all(
                    width: 1.5, color: context.colors.primaryVariant)),
            child: Center(
              child: Text('Heroes Of The World',
                  style: context.textTheme.headline4!.copyWith(
                      color: Color(0xFFFCFCEC), fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}


/*

Expanded(
                      flex: 5,
                      child: SvgPicture.asset(
                          SVGImagePaths.instance.heroesofworld)),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: context.colors.primaryVariant,
                              border: Border.all(
                                  width: 1.5,
                                  color: context.colors.primaryVariant)),
                          child: Center(
                            child: Text('Heroes Of The World',
                                style: context.textTheme.headline4!.copyWith(
                                    color: Color(0xFFFCFCEC),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),

*/