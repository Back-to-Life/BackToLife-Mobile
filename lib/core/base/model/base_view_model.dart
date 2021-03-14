import 'package:backtolife/core/init/network/ICoreDio.dart';
import 'package:backtolife/core/init/network/network_manager.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext context;

  ICoreDio coreDio = NetworkManager.instance.coreDio;
  void setContext(BuildContext context);
  void init();
}
