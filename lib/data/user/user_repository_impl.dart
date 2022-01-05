import 'package:demo/core/network/dio_client.dart';
import 'package:demo/domain/index.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<bool> signUp({required SignUpParams params}) {
    // TODO: implement signUp
    final request = DioClient(url: url, data: data)
  }
}
