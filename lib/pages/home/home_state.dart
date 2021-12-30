import 'package:demo/models/conversation.dart';

class HomeState {
  final List<ConversationItem> items;

  const HomeState({this.items: const <ConversationItem>[]});

  HomeState copyWith(List<ConversationItem>? items) {
    return HomeState(items: items ?? this.items);
  }
}
