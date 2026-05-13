import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../di/injection_container.dart';

class AllBlocProviders {
  static List<BlocProvider> blocProviders = [
    BlocProvider<AuthCubit>(create: (_) => getIt<AuthCubit>()),
  ];
}
