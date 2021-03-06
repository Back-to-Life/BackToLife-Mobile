import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../model/heroes_model.dart';
import '../service/heroes_service.dart';

part 'heroes_view_model.g.dart';

class HeroesViewModel = _HeroesViewModelBase with _$HeroesViewModel;

abstract class _HeroesViewModelBase with Store, BaseViewModel {
  late HeroesService heroesService;
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
