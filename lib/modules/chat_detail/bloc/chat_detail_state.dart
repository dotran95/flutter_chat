import 'package:demo/modules/chat_detail/models/models.dart';

abstract class ChatDetailState {
  const ChatDetailState();

  List<Object> get props => [];
}

class ChatDetailInProgress extends ChatDetailState {}

class ChatDetailSuccess extends ChatDetailState {
  final List<MessageItem> items;

  const ChatDetailSuccess([this.items = const []]);

  @override
  // TODO: implement props
  List<Object> get props => [items];
}

class ChatDetailLoadFailure extends ChatDetailState {}
