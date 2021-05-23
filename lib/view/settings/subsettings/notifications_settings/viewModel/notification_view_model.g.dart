// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationsViewModel on _NotificationsViewModelBase, Store {
  final _$isNotificationChangeAtom =
      Atom(name: '_NotificationsViewModelBase.isNotificationChange');

  @override
  bool get isNotificationChange {
    _$isNotificationChangeAtom.reportRead();
    return super.isNotificationChange;
  }

  @override
  set isNotificationChange(bool value) {
    _$isNotificationChangeAtom.reportWrite(value, super.isNotificationChange,
        () {
      super.isNotificationChange = value;
    });
  }

  final _$_NotificationsViewModelBaseActionController =
      ActionController(name: '_NotificationsViewModelBase');

  @override
  void changeNotificationButton() {
    final _$actionInfo =
        _$_NotificationsViewModelBaseActionController.startAction(
            name: '_NotificationsViewModelBase.changeNotificationButton');
    try {
      return super.changeNotificationButton();
    } finally {
      _$_NotificationsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeToggleButtonInit() {
    final _$actionInfo =
        _$_NotificationsViewModelBaseActionController.startAction(
            name: '_NotificationsViewModelBase._changeToggleButtonInit');
    try {
      return super._changeToggleButtonInit();
    } finally {
      _$_NotificationsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNotificationChange: ${isNotificationChange}
    ''';
  }
}
