import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart' show AuthCubit, AuthState;
import '../di/injection_container.dart';

class AllBlocListeners {
  static List<BlocListener> blocListeners = [
    BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // Handle auth state changes
      },
    ),
  ];
}
