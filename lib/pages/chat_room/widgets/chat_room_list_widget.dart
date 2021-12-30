import 'package:demo/pages/chat_room/chat_room_bloc.dart';
import 'package:demo/pages/chat_room/chat_room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomDetailList extends StatefulWidget {
  const ChatRoomDetailList({Key? key}) : super(key: key);

  @override
  _ChatRoomDetailListState createState() => _ChatRoomDetailListState();
}

class _ChatRoomDetailListState extends State<ChatDetailList> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(
      builder: (context, state) {
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          print("Scroll to bottom");
          _controller.jumpTo(_controller.position.maxScrollExtent);
        });

        return ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: _controller,
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items[index];
            return ChatItemView(
                item: item,
                onPress: () {
                  // print("ChatItemView onPress");
                  // if (item.imageUrl != null) {
                  //   context.present(ImagePreviewPage(imageUrl: item.imageUrl!,));
                  // }
                }).buildMessage();
          },
        );
      },
    );
  }
}
