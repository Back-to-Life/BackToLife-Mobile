import 'package:backtolife/view/authentication/view/authentication_view.dart';
import 'package:backtolife/view/home/view/home_view.dart';
import 'package:backtolife/view/onboarding/view/on_board_view.dart';
import 'package:backtolife/view/profile/view/profile_view.dart';

import 'core/init/theme/app_theme_dark.dart';

import 'core/init/lang/locale_keys_codegen.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider.dart';
import 'core/init/notifier/theme_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager.preferencesInit();

  // await EasyLocalization.ensureInitialized();// easylocalization init yapmak gerekiyor
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
        child: MyApp(),
        fallbackLocale: Locale('en', 'US'),
        assetLoader: CodegenLoader(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        darkTheme: AppThemeDark.instance.theme,
        theme: Provider.of<ThemeNotifier>(context).currentTheme,
        home: HomeView(),
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}
