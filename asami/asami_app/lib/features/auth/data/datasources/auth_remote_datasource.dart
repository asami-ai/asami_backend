import 'package:asami_client/asami_client.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthRemoteDatasource {
  Future<User> login({required String phone});
  Future<User> signUp({required String phone});
  Future<void> logout();
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<User> login({required String phone}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> signUp({required String phone}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
