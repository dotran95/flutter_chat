import 'package:demo/modules/chat_detail/models/message.dart';
import 'package:demo/modules/chat_detail/views/text_message.dart';
import 'package:flutter/material.dart';

import 'image_message.dart';

final double kPaddingVertical = 16.0;
final double kPaddingHorizontal = 20.0;

class MessageView {
  final MessageItem item;
  final double kSizeAvatar = 40.0;
  final VoidCallback? onPress;

  const MessageView({required this.item, this.onPress});

  Widget buildMessage() {
    Widget child = buildChild();
    return item.isOwner
        ? buildRightMessage(item, child)
        : buildLeftMessage(item, child);
  }

  Widget buildChild() {
    return Container();
  }

  Widget buildLeftMessage(MessageItem item, Widget child) {
    return Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(
            left: kPaddingHorizontal,
            top: kPaddingVertical,
            right: 60,
            bottom: 0.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kSizeAvatar / 2),
                child: Image.network(
                  item.ownUser.avatar,
                  height: kSizeAvatar,
                  width: kSizeAvatar,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 8,
                height: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildDateTime(
                        item.createdAtStr, !item.isMessageSameMinuteFromUser),
                    Container(
                        padding: EdgeInsets.only(
                            left: item.type == MessageType.image ? 0.0 : 20,
                            top: 8,
                            right: kPaddingHorizontal,
                            bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey.withOpacity(
                              item.type == MessageType.image ? 0.0 : 0.5),
                        ),
                        child: InkWell(
                          child: child,
                          onTap: onPress,
                        ),
                    ),
                  ],
                ),
              ),
            ]));
  }

  Widget buildRightMessage(MessageItem item, Widget child) {
    final double paddingVertical =
    item.isMessageSameMinuteFromUser ? 3.0 : kPaddingVertical;
    return Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(
            left: 60,
            top: paddingVertical,
            right: kPaddingHorizontal,
            bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildDateTime(
                item.createdAtStr, !item.isMessageSameMinuteFromUser),
            Container(
              padding: EdgeInsets.only(
                  left: kPaddingHorizontal,
                  top: 8.0,
                  right: kPaddingHorizontal,
                  bottom: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.blue
                    .withOpacity(item.type == MessageType.image ? 0.0 : 0.8),
              ),
              child: InkWell(
                child: child,
                onTap: onPress,
              ),
            ),
          ],
        ));
  }

  Widget _buildDateTime(String date, bool visible) {
    return Visibility(
      visible: visible,
      child: Text(
        date,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}

class ChatItemView {
  final MessageItem item;
  final VoidCallback? onPress;

  const ChatItemView({required this.item, this.onPress});

  Widget buildMessage() {
    // TODO: implement buildMessage
    if (item.type == MessageType.image) {
      return ImageMessage(item: item, onPress: onPress).buildMessage();
    }

    return TextMessage(item: item).buildMessage();
  }
}
