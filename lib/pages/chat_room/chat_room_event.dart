import 'dart:io';

abstract class ChatRoomEvent {}

class ChatRoomFetchMessage extends ChatRoomEvent {
  final String conversationId;
  final int page;

  ChatRoomFetchMessage(this.conversationId, this.page);
}

class ChatRoomSendEvent extends ChatRoomEvent {
  final String? message;
  final File? image;

  ChatRoomSendEvent({this.message, this.image});
}