import 'package:demo/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignUpRouter {
  static String name = "SignUpPage";

  static MaterialPageRoute resolveRoute() {
    return MaterialPageRoute(
        builder: (context) {
          return SignUpPage();
        },
        settings: RouteSettings(name: name, arguments: Map()));
  }
}
