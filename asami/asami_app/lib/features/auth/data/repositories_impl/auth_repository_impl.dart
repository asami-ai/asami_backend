import 'package:asami_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:asami_client/asami_client.dart';
import 'package:common_utils2/common_utils2.dart' hide User;
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<Result<User>> login({required String phone}) async {
    try {
      final result = await authRemoteDatasource.login(phone: phone);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await authRemoteDatasource.logout();
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<User>> signUp({required String phone}) async {
    // Simulate API call
    try {
      final result = await authRemoteDatasource.signUp(phone: phone);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
