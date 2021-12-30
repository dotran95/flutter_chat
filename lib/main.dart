import 'package:demo/app.dart';
import 'package:demo/app_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(App()), blocObserver: AppObserver());
}
