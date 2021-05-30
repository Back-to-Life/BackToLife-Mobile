import 'package:backtolife/core/constants/navigation/navigation_constants.dart';

import '../../../core/base/model/base_view_model.dart';
import '../model/heroes_model.dart';
import '../service/heroes_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'heroes_view_model.g.dart';

class HeroesViewModel = _HeroesViewModelBase with _$HeroesViewModel;

abstract class _HeroesViewModelBase with Store, BaseViewModel {
  late HeroesService heroesService;
  // final _baseUrl = 'http://10.0.2.2:5000/';
  late HeroesModel heroesModel;

  @observable
  List<String> heroesImageUrl = [];

  @observable
  List<String> heroesName = [];

  @observable
  List<int> heroesPoint = [];

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    heroesService = HeroesService(dio);
    getDataHeroes();
  }

  @action
  Future<void> getDataHeroes() async {
    changedLoading();
    final responseData = await heroesService.fetchUserControl();
    if (responseData != null) {
      heroesImageUrl = responseData.imageUrls!;
      heroesName = responseData.names!;
      heroesPoint = responseData.points!;
      print(responseData.names);
    }
    changedLoading();
  }

  @action
  void changedLoading() {
    isLoading = !isLoading;
  }

  void goToFullList() {
    navigation.navigateToPage(path: NavigationConstants.FULLHEROES);
  }
}
