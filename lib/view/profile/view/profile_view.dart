import 'package:auto_size_text/auto_size_text.dart';
import 'package:backtolife/core/constants/app/app_constants.dart';
import 'package:backtolife/core/init/notifier/theme_notifier.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../widgets/star/star_rating.dart';

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
        onPageBuilder: (context, _viewModel) => Scaffold(
              body: Column(
                children: [
                  upperStack(context, _viewModel),
                  Expanded(
                    child: Column(
                      children: [
                        Spacer(flex: 1),
                        Expanded(
                          flex: 2,
                          child: Observer(builder: (_) {
                            return _viewModel.isLoadingPageData
                                ? Center(child: CircularProgressIndicator())
                                : Text(
                                    _viewModel.userProfileModel.name ?? '',
                                    style:
                                        context.textTheme.headline4!.copyWith(
                                      color: context.colors.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                          }),
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          child: Observer(builder: (_) {
                            return _viewModel.isLoadingStar
                                ? Center(child: CircularProgressIndicator())
                                : StarDisplayWidget(
                                    value: _viewModel.starValue ?? 0,
                                    filledStar: Icon(Icons.star,
                                        color: Color(0xFFFFC107),
                                        size: context.mediumValue),
                                    unfilledStar: Icon(
                                        Icons.star_border_rounded,
                                        color: context
                                                .read<ThemeNotifier>()
                                                .isLight
                                            ? Color(0xFF989B9B)
                                            : Color(0xFFFCFCEC)
                                                .withOpacity(0.9),
                                        size: context.mediumValue),
                                  );
                          }),
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
                            color: context.colors.secondary,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your Recycling Score',
                        style: context.textTheme.headline5!.copyWith(
                            color: Color(0xFFFFCD00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  Observer(builder: (_) {
                    return _viewModel.isLoadingPageData
                        ? Center(child: CircularProgressIndicator())
                        : CircularPercentIndicator(
                            radius: context.height * 0.2,
                            lineWidth: 10,
                            percent: 0.7,
                            center: Text(
                                '+${_viewModel.userProfileModel.point}',
                                style: context.textTheme.headline3!.copyWith(
                                    color: Color(0xFFC4C0FF),
                                    fontWeight: FontWeight.bold)),
                            progressColor: Color(0xFFC4C0FF),
                            animation: true,
                            animationDuration: 3,
                            backgroundColor:
                                context.read<ThemeNotifier>().isLight
                                    ? Color(0xFF908F8F)
                                    : Color(0xFFD3D3D3),
                          );
                  }),
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
                                color: context.colors.surface.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                ],
              ),
            ));
  }

  Stack upperStack(BuildContext context, ProfileViewModel _viewModel) {
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
              Padding(
                padding: EdgeInsets.only(
                    top: context.height * 0.02, left: context.width * 0.08),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                              SVGImagePaths.instance.profilesettingsview),
                        ),
                      ],
                    )),
              ),
              Positioned(
                  left: context.width * 0.05,
                  top: context.height * 0.05,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: context.mediumValue * 0.8,
                      ),
                      onPressed: () => Navigator.pop(context))),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(top: context.height * 0.15),
            child: Observer(builder: (_) {
              return CircleAvatar(
                radius: context.highValue,
                backgroundColor: Colors.transparent,
                child: _viewModel.isLoading
                    ? Shimmer.fromColors(
                        child: CircleAvatar(radius: context.highValue),
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!)
                    : ClipOval(
                        child: Image.network(
                        _viewModel.userProfileModel.imageUrl ??
                            ApplicationConstants.ImageProfileIsNot,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      )),
              );
            }),
          ),
        ),
        GestureDetector(
          onTap: () => _viewModel.uploadImageFirebase(),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  top: context.height * 0.2, left: context.width * 0.6),
              child: Container(
                child: CircleAvatar(
                  radius: context.mediumValue,
                  backgroundColor: context.colors.primary,
                  child: SvgPicture.asset(
                    SVGImagePaths.instance.pencil,
                    color: context.colors.secondary,
                  ),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: context.colors.secondary,
                        width: context.lowValue * 0.3)),
              ),
            ),
          ),
        )
      ],
    );
  }
}


/*


Avatar(
                shape: AvatarShape.circle(context.highValue),
                placeholderColors: [context.colors.primaryVariant],
                sources: [
                  // NetworkSource('https://picsum.photos/200/300')
                  _viewModel.downloadUrl == null
                      ? GitHubSource('fatihkurcenli')
                      : NetworkSource('${_viewModel.downloadUrl}')
                  //
                ],
                loader: Shimmer.fromColors(
                    child: CircleAvatar(radius: context.highValue),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!),
                name: 'Fatih Kurçenli',
                elevation: 20,
                border: Border.all(
                    color: context.colors.secondary,
                    width: context.lowValue * 0.6),
                textStyle: TextStyle(fontSize: context.mediumValue),
              );


              */