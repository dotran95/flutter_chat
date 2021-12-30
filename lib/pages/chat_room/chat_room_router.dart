import 'package:demo/pages/chat_room/chat_room_page.dart';
import 'package:flutter/material.dart';

class ChatRoomRouter {
  static String name = "ChatRoom";

  static goToChatRoom(String conversationId) {
    return MaterialPageRoute(
        builder: (context) => ChatRoomDetailPage(conversationId: conversationId), settings: RouteSettings(name: name));
  }
}
