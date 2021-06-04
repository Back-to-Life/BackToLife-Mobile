// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  final _$thisTodayAtom = Atom(name: '_SplashViewModelBase.thisToday');

  @override
  String? get thisToday {
    _$thisTodayAtom.reportRead();
    return super.thisToday;
  }

  @override
  set thisToday(String? value) {
    _$thisTodayAtom.reportWrite(value, super.thisToday, () {
      super.thisToday = value;
    });
  }

  @override
  String toString() {
    return '''
thisToday: ${thisToday}
    ''';
  }
}
