import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'heroes_view_model.g.dart';

class HeroesViewModel = _HeroesViewModelBase with _$HeroesViewModel;

abstract class _HeroesViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
