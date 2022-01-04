import 'package:demo/modules/chat_detail/views/chat_message.dart';
import 'package:demo/modules/chat_detail/models/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextMessage extends MessageView {
  final double kSizeAvatar = 40.0;

  const TextMessage({required MessageItem item}) : super(item: item);

  @override
  Widget buildChild() {
    // TODO: implement buildChild
    return Text(item.text ?? "");
  }
}
