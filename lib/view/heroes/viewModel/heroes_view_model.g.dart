// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroes_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeroesViewModel on _HeroesViewModelBase, Store {
  final _$heroesAtom = Atom(name: '_HeroesViewModelBase.heroes');

  @override
  List<HeroesModel> get heroes {
    _$heroesAtom.reportRead();
    return super.heroes;
  }

  @override
  set heroes(List<HeroesModel> value) {
    _$heroesAtom.reportWrite(value, super.heroes, () {
      super.heroes = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HeroesViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getDataHeroesAsyncAction =
      AsyncAction('_HeroesViewModelBase.getDataHeroes');

  @override
  Future<void> getDataHeroes() {
    return _$getDataHeroesAsyncAction.run(() => super.getDataHeroes());
  }

  final _$_HeroesViewModelBaseActionController =
      ActionController(name: '_HeroesViewModelBase');

  @override
  void changedLoading() {
    final _$actionInfo = _$_HeroesViewModelBaseActionController.startAction(
        name: '_HeroesViewModelBase.changedLoading');
    try {
      return super.changedLoading();
    } finally {
      _$_HeroesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heroes: ${heroes},
isLoading: ${isLoading}
    ''';
  }
}
