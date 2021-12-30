import 'package:demo/modules/chat_detail/views/chat_message.dart';
import 'package:demo/modules/chat_detail/models/message.dart';
import 'package:flutter/material.dart';

final double kWidthImage = 100;

class ImageMessage extends MessageView {
  const ImageMessage({required MessageItem item, VoidCallback? onPress}) : super(item: item, onPress: onPress);

  double _calculateHeightImage() {
    return kWidthImage * (item.size?.height ?? 0) / (item.size?.width ?? 0);
  }

  @override
  Widget buildChild() {
    // TODO: implement buildChild
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        item.imageUrl ?? "",
        height: _calculateHeightImage(),
        width: kWidthImage,
      ),
    );
  }
}
