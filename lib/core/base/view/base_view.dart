import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:backtolife/core/init/internet_connection/connectivity_provider.dart';
import 'package:backtolife/core/init/internet_connection/no_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      required this.viewModel,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(
      builder: (consumerContext, listenModel, child) {
        if (listenModel.isOnline != null) {
          if (listenModel.isOnline!) {
            return widget.onPageBuilder(context, model);
          } else {
            return NoConnected();
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
