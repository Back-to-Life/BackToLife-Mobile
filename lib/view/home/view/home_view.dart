import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/language/language_manager.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../viewModel/home_view_model.dart';

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
}
 */

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: 150,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
