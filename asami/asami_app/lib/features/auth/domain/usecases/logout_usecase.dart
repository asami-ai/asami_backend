import 'package:common_utils2/common_utils2.dart';
import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

@lazySingleton
class LogoutUseCase {
  final AuthRepository authRepository;
  LogoutUseCase({required this.authRepository});

  Future<Result<void>> call() async {
    return await authRepository.logout();
  }
}
