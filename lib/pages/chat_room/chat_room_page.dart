import 'package:demo/pages/chat_room/chat_room_bloc.dart';
import 'package:demo/pages/chat_room/chat_room_event.dart';
import 'package:demo/pages/chat_room/widgets/chat_room_bottom_input_widget.dart';
import 'package:demo/pages/chat_room/widgets/chat_room_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomDetailPage extends StatelessWidget {
  final String conversationId;

  const ChatRoomDetailPage({Key? key, required this.conversationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(conversationId),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (_) =>
              ChatRoomBloc()..add(ChatRoomFetchMessage(conversationId, 0)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: ChatRoomDetailList()),
                ChatRoomBottomView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
