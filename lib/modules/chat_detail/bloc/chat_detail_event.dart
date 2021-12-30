import 'package:demo/modules/chat_detail/models/models.dart';

abstract class ChatDetailEvent {
  const ChatDetailEvent();

  List<Object> get props => [];
}

class ChatDetailLoaded extends ChatDetailEvent {}

class ChatDetailLoadMore extends ChatDetailEvent {}

class ChatDetailSent extends ChatDetailEvent {
  final String message;

  const ChatDetailSent(this.message);
}
