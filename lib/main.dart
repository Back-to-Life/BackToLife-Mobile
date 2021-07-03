import 'package:backtolife/view/home/view/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/locale_keys_codegen.g.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notification/firebase_notification_handler.dart';
import 'core/init/notifier/provider.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'core/init/theme/dark/app_theme_dark.dart';
import 'view/barcode/view/scan_barcode_view.dart';
import 'view/splash/view/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
        child: MyApp(),
        fallbackLocale: Locale('en', 'US'),
        assetLoader: CodegenLoader(),
        startLocale: LanguageManager.instance.enLocale,
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseNotifications firebaseNotifications = FirebaseNotifications();
  @override
  void initState() {
    super.initState();
    firebaseNotifications.setupFirebase(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      darkTheme: AppThemeDark.instance.theme,
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: SplashView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }

  void getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    print(token);
  }
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handle Background Service $message');
}
