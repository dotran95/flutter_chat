import 'package:demo/models/conversation.dart';

abstract class HomeEvent {}

class HomeFetchEvent extends HomeEvent {}

class HomeFetchMoreEvent extends HomeEvent {
  final int page;

  HomeFetchMoreEvent(this.page);
}