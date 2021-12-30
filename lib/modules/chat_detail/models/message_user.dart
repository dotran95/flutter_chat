import 'package:flutter/material.dart';

class MessageUser {
  final int userId;
  final String userName;
  final String avatar;

  MessageUser(
      {required this.userId, required this.userName, required this.avatar});

  static var guestUser = MessageUser(
      userId: 1,
      userName: "Dotn",
      avatar:
          "https://goldseasonnguyentuan.com/wp-content/uploads/2021/08/aragaki-yui-phim-va-chuong-trinh-truyen-hinh-2.jpg");
  static var guestUser2 = MessageUser(
      userId: 2,
      userName: "Dotn 2",
      avatar:
      "https://goldseasonnguyentuan.com/wp-content/uploads/2021/08/aragaki-yui-phim-va-chuong-trinh-truyen-hinh-2.jpg");
}
