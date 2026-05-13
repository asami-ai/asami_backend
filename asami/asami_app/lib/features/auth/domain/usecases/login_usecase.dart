import 'package:asami_client/asami_client.dart';
import 'package:common_utils2/common_utils2.dart' hide User;
import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Result<User>> call({required String phone}) async {
    return await authRepository.login(phone: phone);
  }
}
