import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigatorX on BuildContext {
  push(Widget scene) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => scene));
  }

  present(Widget scene) {
    Navigator.of(this).push(CupertinoPageRoute(builder: (context) => scene, fullscreenDialog: true));
  }
}
