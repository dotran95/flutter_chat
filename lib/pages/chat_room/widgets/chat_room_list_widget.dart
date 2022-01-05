import 'dart:async';

import 'package:demo/extension/index.dart';
import 'package:demo/models/index.dart';
import 'package:demo/pages/chat_room/chat_room_bloc.dart';
import 'package:demo/pages/chat_room/chat_room_state.dart';
import 'package:demo/pages/chat_room/widgets/chat_message.dart';
import 'package:demo/pages/image_preview/image_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ChatRoomDetailList extends StatefulWidget {
  const ChatRoomDetailList({Key? key}) : super(key: key);

  @override
  _ChatRoomDetailListState createState() => _ChatRoomDetailListState();
}

class _ChatRoomDetailListState extends State<ChatRoomDetailList> {
  final _controller = ScrollController();
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      print("visible: " + visible.toString());
      if (visible) {
        _onScrollToBottom();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(
      builder: (context, state) {
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          print("Scroll to bottom");
          _onScrollToBottom();
        });

        return KeyboardDismissOnTap(
            child: ListView.builder(
          controller: _controller,
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items[index];
            return ChatItemView(
                item: item,
                onPress: () {
                  if (item.imageUrl != null || item.image != null) {
                    _gotoImagePreviewScreen(item);
                  }
                }).buildMessage();
          },
        ));
      },
    );
  }

  _gotoImagePreviewScreen(Message item) {
    if (item.imageUrl != null || item.image != null) {
      final scene =
          ImagePreviewPage(imageUrl: item.imageUrl, imageFile: item.image);
      context.present(scene: scene);
    }
  }

  _onScrollToBottom() {
    _controller.animateTo(_controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }
}
