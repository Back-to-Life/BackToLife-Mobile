import '../../components/internet_connection/connectivity_provider.dart';
import 'settings_notifier.dart';

import 'language_notifier.dart';

import '../navigation/navigation_service.dart';
import 'theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();

    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(), lazy: true),
    ChangeNotifierProvider<ConnectivityProvider>(
        create: (context) => ConnectivityProvider(), lazy: true),
    ChangeNotifierProvider<LanguageNotifier>(
        create: (context) => LanguageNotifier(), lazy: true),
    ChangeNotifierProvider<SettingsNotifier>(
        create: (context) => SettingsNotifier(), lazy: true),
    Provider.value(value: NavigationService.instance)
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
