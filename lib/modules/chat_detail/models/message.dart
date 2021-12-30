import 'dart:ffi';

import 'package:demo/modules/chat_detail/models/message_user.dart';
import 'package:intl/intl.dart';

enum MessageType { text, image, emoji }

class ImageSize {
  final double width;
  final double height;

  ImageSize({required this.width, required this.height});
}

class MessageItem {
  final int messageId;
  final int conversationId;
  final MessageType type;
  final String? text;
  final String? imageUrl;
  final ImageSize? size;
  final MessageUser ownUser;
  final bool isOwner;
  final String createdAt;
  bool isMessageSameMinuteFromUser;// message same minute from same user

  String get createdAtStr {
    final date = DateTime.parse(createdAt);
    return DateFormat('hh:mm a').format(date);
  }

  MessageItem({
    required this.messageId,
    required this.conversationId,
    required this.type,
    required this.ownUser,
    required this.isOwner,
    required this.createdAt,
    this.isMessageSameMinuteFromUser = false,
    this.text,
    this.imageUrl,
    this.size,
  });
}