import 'package:demo/modules/chat_detail/bloc/chat_detail.dart';
import 'package:demo/modules/chat_detail/views/chat_message.dart';
import 'package:demo/modules/image_preview/image_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:demo/extension/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailList extends StatefulWidget {
  const ChatDetailList({Key? key}) : super(key: key);

  @override
  _ChatDetailListState createState() => _ChatDetailListState();
}

class _ChatDetailListState extends State<ChatDetailList> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatDetailBloc, ChatDetailState>(
      builder: (context, state) {
        if (state is ChatDetailSuccess) {
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
                    print("ChatItemView onPress");
                    if (item.imageUrl != null) {
                      context.present(ImagePreviewPage(imageUrl: item.imageUrl!,));
                    }
                  }).buildMessage();
            },
          );
        }
        return Container(
          color: Colors.red,
        );
      },
    );
  }
}
