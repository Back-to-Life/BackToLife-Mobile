import 'package:flutter/material.dart';

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
