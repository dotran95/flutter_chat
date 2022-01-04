import 'dart:io';

import 'package:demo/models/user.dart';
import 'package:intl/intl.dart';

enum MessageType { text, image, emoji }

class ImageSize {
  final double width;
  final double height;

  ImageSize({required this.width, required this.height});
}

class Message {
  final int messageId;
  final int conversationId;
  final MessageType type;
  final String? text;
  final String? imageUrl;
  final File? image;
  final ImageSize? size;
  final User ownUser;
  final bool isOwner;
  final String createdAt;
  bool isMessageSameMinuteFromUser; // message same minute from same user

  String get createdAtStr {
    final date = DateTime.parse(createdAt);
    return DateFormat('hh:mm a').format(date);
  }

  Message({
    required this.messageId,
    required this.conversationId,
    required this.type,
    required this.ownUser,
    required this.isOwner,
    required this.createdAt,
    this.isMessageSameMinuteFromUser = false,
    this.text,
    this.imageUrl,
    this.image,
    this.size,
  });
}
