import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreviewPage extends StatelessWidget {
  const ImagePreviewPage({Key? key, this.imageUrl, this.imageFile})
      : super(key: key);

  final String? imageUrl;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            _buildImage(),
            Positioned(
                top: 10,
                left: 10,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/ic_close.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _buildImage() {
    if (imageFile != null) {
      return Image.file(
        imageFile!,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return Image.network(
      imageUrl!,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
