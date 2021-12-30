import 'dart:io';
import 'package:flutter/material.dart';

class ImagePreviewPage extends StatelessWidget {
  final String? imageUrl;
  final String? path;

  const ImagePreviewPage({Key? key, this.imageUrl, this.path})
      : super(key: key);

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
                        "assets/images/ic_back.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            print("done");
          },
          icon: Icon(Icons.done),
          label: Text('Done'),
        ));
  }

  _buildImage() {
    if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        },
      );
    }
    if (path != null) {
      return Image.file(
        File(path!),
        width: double.infinity,
        height: double.infinity,
      );
    }
  }
}
