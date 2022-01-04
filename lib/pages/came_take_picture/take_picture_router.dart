import 'dart:io';
import 'package:camera/camera.dart';
import 'package:demo/extension/navigator.dart';
import 'package:demo/extension/object_extension.dart';
import 'package:demo/pages/came_take_picture/take_picture_page.dart';
import 'package:flutter/material.dart';

class TakePictureRouter {
  static String name = "TakePicture";
  static String kImagePath = "ImagePath";

  static present(
      {required BuildContext context, required String fromRouteName}) async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    final scene =
        TakePicturePage(camera: firstCamera, fromRouteName: fromRouteName);
    final params = Map();
    params[kImagePath] = null;
    return await context.present(
        scene: scene, routedName: TakePictureRouter.name, params: params);
  }

  static getImage(Object? args) async {
    try {
      final String? path = args?.valueForKey(kImagePath);
      if (path != null) {
        final file = File(path);
        return file;
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
