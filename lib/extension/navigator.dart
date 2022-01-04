import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigatorX on BuildContext {
  push(
      {required Widget scene,
      RouteSettings? settings,
      String? routedName,
      Map? params}) {
    final routeSettings = settings ??
        _createDefaultSettings(routedName: routedName, params: params);
    final route =
        MaterialPageRoute(builder: (context) => scene, settings: routeSettings);
    return Navigator.of(this).push(route);
  }

  present(
      {required Widget scene,
      RouteSettings? settings,
      String? routedName,
      Map? params}) {
    final routeSettings = settings ??
        _createDefaultSettings(routedName: routedName, params: params);
    final route = CupertinoPageRoute(
        builder: (context) => scene,
        settings: routeSettings,
        fullscreenDialog: true);
    return Navigator.of(this).push(route);
  }

  RouteSettings _createDefaultSettings({String? routedName, Map? params}) {
    return RouteSettings(name: routedName ?? "", arguments: params ?? Map());
  }
}
