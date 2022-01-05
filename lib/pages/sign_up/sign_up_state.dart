abstract class SignUpState {}

class SignUpFullNameState extends SignUpState {}

class SignUpUserNameState extends SignUpState {
  final String fullName;

  SignUpUserNameState({required this.fullName});
}

class SignUpPasswordState extends SignUpState {
  final String fullName;
  final String userName;

  SignUpPasswordState({required this.fullName, required this.userName});
}

class SignUpConfirmState extends SignUpState {
  final String fullName;
  final String userName;
  final String password;

  SignUpConfirmState(
      {required this.fullName, required this.userName, required this.password});
}
