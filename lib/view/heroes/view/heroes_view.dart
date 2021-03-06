import 'dart:ui';

import 'package:avatars/avatars.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../service/heroes_service.dart';
import '../viewModel/heroes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

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
              appBar: AppBar(
                iconTheme: IconThemeData(color: context.colors.surface),
              ),
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
                                      color: Color(0xFFE2DFDF).withOpacity(0.6),
                                      blurRadius: 4,
                                      offset: Offset(-10, -10),
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
                                                    color: Color(0xFF4E5F49))),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: Observer(builder: (_) {
                                        return _viewModel.heroesImageUrl.isEmpty
                                            ? Center(
                                                child: CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Color(0xFF4E5F49))))
                                            : ListView.builder(
                                                itemCount: 3,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      context
                                                          .emptySizedHeightBoxLow,
                                                      ListTile(
                                                        leading:
                                                            _pictureProfile(
                                                                context,
                                                                _viewModel,
                                                                index),
                                                        title: _heroesName(
                                                            _viewModel,
                                                            index,
                                                            context),
                                                        trailing: _heroesPoint(
                                                            _viewModel,
                                                            index,
                                                            context),
                                                      ),
                                                      Divider(
                                                          height: 1.5,
                                                          color: Color(
                                                              0xFFC4C6C3)),
                                                      context
                                                          .emptySizedHeightBoxLow,
                                                    ],
                                                  );
                                                });
                                      })),
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: _viewModel.goToFullList,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Full List ',
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                      color: Color(0xFF4E5F49)),
                                              textAlign: TextAlign.end,
                                            ),
                                            Icon(Icons.arrow_forward_ios,
                                                size: 13,
                                                color: Color(0xFF4E5F49)),
                                            context.emptySizedWidthBoxLow3x,
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

  Text _heroesPoint(
      HeroesViewModel _viewModel, int index, BuildContext context) {
    return Text(('+' + _viewModel.heroesPoint[index].toString()),
        style: context.textTheme.headline6!.copyWith(color: Color(0xFFC4C0FF)));
  }

  Text _heroesName(
      HeroesViewModel _viewModel, int index, BuildContext context) {
    return Text(
      _viewModel.heroesName[index],
      style: context.textTheme.headline6!
          .copyWith(fontSize: 14, color: Color(0xFF4E5F49)),
    );
  }

  Avatar _pictureProfile(
      BuildContext context, HeroesViewModel _viewModel, int index) {
    return Avatar(
        shape: AvatarShape.circle(context.mediumValue * 0.7),
        placeholderColors: [context.colors.primaryVariant],
        sources: [NetworkSource(_viewModel.heroesImageUrl[index])],
        loader: Shimmer.fromColors(
            child: CircleAvatar(radius: context.mediumValue * 0.7),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!),
        textStyle: TextStyle(fontSize: context.mediumValue));
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
