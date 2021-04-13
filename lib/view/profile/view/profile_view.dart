import 'package:auto_size_text/auto_size_text.dart';
import 'package:backtolife/view/widgets/star/star_rating.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../viewModel/profile_view_model.dart';
import '../../widgets/loading/loading_page.dart';
import '../../widgets/star/star_background.dart';
import 'package:flutter/material.dart';

import 'package:avatars/avatars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
        viewModel: ProfileViewModel(),
        onModelReady: (ProfileViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, value) => Scaffold(
              body: Column(
                children: [
                  upperStack(context),
                  Expanded(
                    child: Column(
                      children: [
                        Spacer(flex: 1),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Fatih Kurçenli',
                            style: context.textTheme.headline4!.copyWith(
                                color: context.colors.onError,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          child: StarDisplayWidget(
                            value: 5,
                            filledStar: Icon(Icons.star,
                                color: context.colors.secondary,
                                size: context.mediumValue),
                            unfilledStar: Icon(Icons.star_border_rounded,
                                size: context.mediumValue),
                          ),
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Scorboard',
                        style: context.textTheme.headline4!.copyWith(
                            color: context.colors.onError,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your Recycling Score',
                        style: context.textTheme.headline5!.copyWith(
                            color: context.colors.secondary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  CircularPercentIndicator(
                    radius: context.height * 0.2,
                    lineWidth: 10,
                    percent: 0.7,
                    center: Text('+60',
                        style: context.textTheme.headline3!.copyWith(
                            color: context.colors.secondaryVariant,
                            fontWeight: FontWeight.bold)),
                    progressColor: context.colors.secondaryVariant,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('web sitesi açılcak');
                      },
                      child: Padding(
                          padding: context.paddingMedium,
                          child: AutoSizeText(
                            'To find out the equivalent of your score,\n please visit our website',
                            maxLines: 2,
                            style: context.textTheme.headline2!.copyWith(
                                color: context.colors.onError.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                ],
              ),
            ));
  }

  Stack upperStack(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.25,
          decoration: BoxDecoration(
              color: context.colors.primaryVariant,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(context.width * 0.15),
                  bottomRight: Radius.circular(context.width * 0.15))),
          child: Stack(
            children: [
              StarBackGround(),
              Positioned(
                  left: context.width * 0.05,
                  top: context.height * 0.05,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: context.mediumValue * 0.8,
                      ),
                      onPressed: () {})),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(top: context.height * 0.15),
            child: Avatar(
              shape: AvatarShape.circle(context.highValue),
              placeholderColors: [context.colors.primaryVariant],
              sources: [
                // NetworkSource('https://picsum.photos/200/300')
                // GitHubSource('fatihkurcenli')
                // GitHubSource('senakbulut')
                InstagramSource('senakbulut_') //My Love <3
              ],
              loader: LoadingPage(),
              name: 'Fatih Kurçenli',
              elevation: 20,
              border: Border.all(
                  color: Colors.green, width: context.lowValue * 0.6),
              textStyle: TextStyle(fontSize: context.mediumValue),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
                top: context.height * 0.2, left: context.width * 0.6),
            child: Container(
              child: CircleAvatar(
                radius: context.mediumValue,
                backgroundColor: context.colors.primary,
                child: SvgPicture.asset(SVGImagePaths.instance.pencil),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.green, width: context.lowValue * 0.3)),
            ),
          ),
        )
      ],
    );
  }
}
