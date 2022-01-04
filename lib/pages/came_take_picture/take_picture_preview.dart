import 'dart:io';
import 'package:demo/pages/came_take_picture/index.dart';
import 'package:flutter/material.dart';

class TakePicturePreviewPage extends StatelessWidget {
  final String path;
  final String fromRouteName;

  const TakePicturePreviewPage(
      {Key? key, required this.path, required this.fromRouteName})
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
          onPressed: () {
            Navigator.of(context).popUntil((route) {
              bool isAllowPopToRoute = route.settings.name == fromRouteName;
              if (isAllowPopToRoute) {
                print(route.settings.arguments.toString() + (route.settings.name ?? ""));
                if (route.settings.arguments is Map) {
                  (route.settings.arguments as Map)[TakePictureRouter
                      .kImagePath] = path;
                }
              }
              return isAllowPopToRoute;
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
