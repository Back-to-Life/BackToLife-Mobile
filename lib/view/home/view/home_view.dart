import 'package:auto_size_text/auto_size_text.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../viewModel/home_view_model.dart';
import '../../widgets/ImageContainer/image_container.dart';
import '../../widgets/ToggleButton/toggle_button_container.dart';
import 'package:flutter/material.dart';

import 'package:avatars/avatars.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BaseState<Home> {
  HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => Text("data"),
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.welcome.locale),
          actions: [changeLanguage()],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          viewModel.increment();
        }),
        body: Observer(builder: (context) => Text(viewModel.number.toString())),
      );

  IconButton changeLanguage() {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          context.locale = LanguageManager.instance.enLocale;
        });
  }
}*/

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (HomeViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewModel) => Scaffold(
              body: Padding(
                padding: context.paddingLow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: context.paddingLowHorizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Avatar(
                              shape: AvatarShape.circle(context.mediumValue),
                              placeholderColors: [
                                context.colors.primaryVariant
                              ],
                              name: "Fatih Kurçenli",
                              elevation: 10,
                              border: Border.all(
                                  color: Colors.green,
                                  width: context.lowValue * 0.35),
                              textStyle:
                                  TextStyle(fontSize: context.mediumValue),
                            ),
                            Text(
                              "Back TO LIFE",
                              style: context.textTheme.headline6.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.primaryVariant),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            Positioned(
                              left: context.width * 0.05,
                              child: Text(
                                "Hello!\nFatih Kurçenli",
                                style: context.textTheme.headline4.copyWith(
                                    color: context.colors.primaryVariant),
                              ),
                            ),
                            Padding(
                              // padding: context.paddingNormal,
                              padding: EdgeInsets.only(top: 100),
                              child: Container(
                                width: double.infinity,
                                // height: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        context.mediumValue),
                                    color: context.colors.secondaryVariant
                                        .withOpacity(0.8)),
                                child: Padding(
                                  padding: context.paddingMedium,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Let's Make\nMoney\nBy Recycling",
                                        style: context.textTheme.headline5
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                right: context.lowValue * 0.2,
                                // bottom: context.lowValue * 0.1,
                                child: SvgPicture.asset(
                                    SVGImagePaths.instance.world)),
                          ],
                        )),
                    build4Container(context, viewModel),
                  ],
                ),
              ),
            ));
  }

  Expanded build4Container(BuildContext context, HomeViewModel viewModel) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: ImageContainerCustom()),
                Expanded(child: ImageContainerCustom()),
              ],
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: ImageContainerCustom()),
                Expanded(child: ImageContainerCustom()),
              ],
            ),
          ),
          Spacer(flex: 1),
          Row(
            children: [
              Observer(builder: (_) {
                return ToggleButtonContainer(
                  callback: viewModel.changedToggle,
                  isSelected: viewModel.isSelectedToggle,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

/*
TODO gridviewBuilder learnning
  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: context.paddingNormal,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: context.highValue * 3,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: context.highValue,
                                    mainAxisSpacing: context.mediumValue),
                            itemCount: myProducts.length,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: SvgPicture.asset(
                                            SVGImagePaths.instance.world)),
                                    Expanded(
                                      flex: 1,
                                      child: Text(myProducts[index]["name"]),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: context.colors.primaryVariant,
                                    borderRadius: BorderRadius.circular(30)),
                              );
                            }),
                      ),
                    ),
*/
/*
 Padding(
          padding: context.paddingLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: context.paddingLowHorizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Avatar(
                        shape: AvatarShape.circle(context.mediumValue),
                        placeholderColors: [context.colors.primaryVariant],
                        name: "Fatih Kurçenli",
                        elevation: 5,
                        border: Border.all(
                            color: Colors.green,
                            width: context.lowValue * 0.35),
                        textStyle: TextStyle(fontSize: context.mediumValue),
                      ),
                      Text(
                        "Back TO LIFE",
                        style: context.textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colors.primaryVariant),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: context.lowValue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello!\nFatih Kurçenli",
                        style: context.textTheme.headline4
                            .copyWith(color: context.colors.primaryVariant),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: context.mediumValue),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(context.mediumValue),
                              color: context.colors.secondaryVariant
                                  .withOpacity(0.8)),
                          child: Padding(
                            padding: context.paddingMedium,
                            child: Text(
                              "Let's Make\nMoney\nBy Recycling",
                              style: context.textTheme.headline5
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          right: context.lowValue * 0.5,
                          bottom: context.lowValue * 0.05,
                          child: Padding(
                            padding: EdgeInsets.only(top: context.highValue),
                            child:
                                SvgPicture.asset(SVGImagePaths.instance.world),
                          ))
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: context.paddingNormal,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: context.highValue * 3,
                          childAspectRatio: 2 / 2,
                          crossAxisSpacing: context.highValue,
                          mainAxisSpacing: context.mediumValue),
                      itemCount: myProducts.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: SvgPicture.asset(
                                      SVGImagePaths.instance.world)),
                              Expanded(
                                flex: 1,
                                child: Text(myProducts[index]["name"]),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: context.colors.primaryVariant,
                              borderRadius: BorderRadius.circular(30)),
                        );
                      }),
                ),
              ),
              Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    width: context.width * 0.15,
                    height: context.height * 0.05,
                    decoration: BoxDecoration(
                        color: context.colors.secondaryVariant,
                        borderRadius:
                            BorderRadius.circular(context.mediumValue)),
                  )
                ]),
              )
            ],
          ),
        ),
 */
