import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:backtolife/view/heroes/model/heroes_model.dart';
import 'package:backtolife/view/heroes/service/heroes_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'heroes_view_model.g.dart';

class HeroesViewModel = _HeroesViewModelBase with _$HeroesViewModel;

abstract class _HeroesViewModelBase with Store, BaseViewModel {
  late HeroesService heroesService;
  // final _baseUrl = 'http://10.0.2.2:5000/';

  @observable
  List<HeroesModel> heroes = [];

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    // final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    heroesService = HeroesService(dio);
    getDataHeroes();
  }

  @action
  Future<void> getDataHeroes() async {
    changedLoading();
    final responseData = await heroesService.fetchUserControl();
    heroes = responseData;
    changedLoading();
  }

  @action
  void changedLoading() {
    isLoading = !isLoading;
  }
}
