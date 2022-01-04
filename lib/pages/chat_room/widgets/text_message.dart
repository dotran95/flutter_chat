import 'package:demo/pages/chat_room/widgets/chat_message.dart';
import 'package:demo/models/index.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextMessage extends MessageView {
  final double kSizeAvatar = 40.0;

  const TextMessage({required Message item}) : super(item: item);

  @override
  Widget buildChild() {
    // TODO: implement buildChild
    return Text(item.text ?? "");
  }
}
