abstract class UserRepository {
  Future<bool> signUp({required SignUpParams params});
}

class SignUpParams {
  final String fullName;
  final String userName;
  final String password;

  SignUpParams(
      {required this.fullName, required this.password, required this.userName});

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'password': password,
        'userName': userName,
      };
}
