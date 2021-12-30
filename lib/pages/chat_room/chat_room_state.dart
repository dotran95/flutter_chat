/*
 *
 * ChatRoomState
 *
 */
import 'package:demo/models/index.dart';

class ChatRoomState {

  final List<Message> items;

  const ChatRoomState({ required this.items });

  ChatRoomState copyWith({
    List<Message>? items
  }) {
    return ChatRoomState(items: items ?? this.items);
  }
}