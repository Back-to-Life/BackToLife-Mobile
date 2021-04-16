import 'package:backtolife/core/init/internet_connection/connectivity_provider.dart';

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
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()),
    ChangeNotifierProvider<ConnectivityProvider>(
        create: (context) => ConnectivityProvider()),
    Provider.value(value: NavigationService.instance)
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
