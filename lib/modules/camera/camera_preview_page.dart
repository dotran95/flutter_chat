import 'dart:io';
import 'package:flutter/material.dart';

class CameraPreviewPage extends StatelessWidget {
  final String path;

  const CameraPreviewPage({Key? key, required this.path})
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
            Navigator.of(context).popUntil((route) {
              print(route.settings.name);
              return route.isFirst;
            });
          },
          icon: Icon(Icons.done),
          label: Text('Done'),
        ));
  }

  _buildImage() {
    return Image.file(
      File(path),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
