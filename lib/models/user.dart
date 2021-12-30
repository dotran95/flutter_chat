class User {
  final int userId;
  final String userName;
  final String avatar;

  User({required this.userId, required this.userName, required this.avatar});

  static var guestUser = User(
      userId: 1,
      userName: "Simon",
      avatar:
          "https://goldseasonnguyentuan.com/wp-content/uploads/2021/08/aragaki-yui-phim-va-chuong-trinh-truyen-hinh-2.jpg");
  static var guestUser2 = User(
      userId: 2,
      userName: "Anthony",
      avatar:
          "https://goldseasonnguyentuan.com/wp-content/uploads/2021/08/aragaki-yui-phim-va-chuong-trinh-truyen-hinh-2.jpg");
}
