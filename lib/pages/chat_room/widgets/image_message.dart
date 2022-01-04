import 'package:demo/pages/chat_room/widgets/chat_message.dart';
import 'package:demo/models/index.dart';
import 'package:flutter/material.dart';

final double kWidthImage = 100;

class ImageMessage extends MessageView {
  const ImageMessage({required Message item, VoidCallback? onPress})
      : super(item: item, onPress: onPress);

  double _calculateHeightImage() {
    return kWidthImage * (item.size?.height ?? 0) / (item.size?.width ?? 0);
  }

  @override
  Widget buildChild() {
    // TODO: implement buildChild

    if (item.image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.file(
          item.image!,
          height: _calculateHeightImage(),
          width: kWidthImage,
        ),
      );
    }

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
