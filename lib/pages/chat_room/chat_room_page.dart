import 'package:flutter/material.dart';

class ChatRoomDetailPage extends StatelessWidget {
  final String conversationId;
  const ChatRoomDetailPage({Key? key, required this.conversationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(conversationId),
      ),
    );
  }
}
