/*
*
* Home Router
*
*/

import 'package:demo/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class HomeRouter {
  static String name = "Home";

  static goToHome() {
    return MaterialPageRoute(
        builder: (context) => HomePage(), settings: RouteSettings(name: name));
  }
}
