import 'package:asami_client/asami_client.dart';
import 'package:common_utils2/common_utils2.dart' hide User;


/// Authentication repository contract
abstract interface class AuthRepository {
  Future<Result<User>> login({required String phone});
  Future<Result<User>> signUp({required String phone});
  Future<Result<void>> logout();
}
