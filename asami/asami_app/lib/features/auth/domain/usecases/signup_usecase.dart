import 'package:asami_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:asami_client/asami_client.dart';
import 'package:common_utils2/common_utils2.dart' hide User;
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUseCase {
  final AuthRepository authRepository;
  SignUpUseCase({required this.authRepository});

  Future<Result<User>> call({required String phone}) async {
    return await authRepository.signUp(phone: phone);
  }
}
