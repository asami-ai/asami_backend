// import 'package:asami_app/core/di/injection_container.dart';
// import 'package:asami_app/features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:common_designs/common_designs.dart';
// import 'package:common_utils2/common_utils2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/router/app_router.dart';
// import '../../../../core/router/routes.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _phoneController = TextEditingController();
//   String _selectedCountryCode = '+1';

//   final List<Map<String, String>> _countryCodes = [
//     {'code': '+1', 'country': 'US/Canada'},
//     {'code': '+44', 'country': 'UK'},
//     {'code': '+234', 'country': 'Nigeria'},
//     {'code': '+91', 'country': 'India'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<AuthCubit, AuthState>(
//         bloc: getIt<AuthCubit>(),
//         listener: (context, state) {
//           state.maybeWhen(
//             orElse: () {},
//             authenticated: (user) {
//               AppToast.success(context, 'Successfully logged in!');
//             },
//             error: (message) {
//               AppToast.error(context, message);
//             },
//           );
//         },
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24),
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 400),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       // Logo/Brand
//                       Icon(
//                         Icons.shopping_bag,
//                         size: 80,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                       const SizedBox(height: 16),

//                       // Title
//                       Text(
//                         'Welcome Back',
//                         style: Theme.of(context).textTheme.headlineLarge,
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Sign in to continue',
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                               color: Colors.grey[600],
//                             ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 48),

//                       // Country Code Dropdown
//                       DropdownButtonFormField<String>(
//                         value: _selectedCountryCode,
//                         decoration: const InputDecoration(
//                           labelText: 'Country Code',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.flag),
//                         ),
//                         items: _countryCodes.map((item) {
//                           return DropdownMenuItem(
//                             value: item['code'],
//                             child: Text('${item['code']} (${item['country']})'),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedCountryCode = value!;
//                           });
//                         },
//                       ),
//                       const SizedBox(height: 16),

//                       // Phone Number Input
//                       TextFormField(
//                         controller: _phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           labelText: 'Phone Number',
//                           border: const OutlineInputBorder(),
//                           prefixIcon: const Icon(Icons.phone),
//                           hintText: 'Enter your phone number',
//                           prefixText: '$_selectedCountryCode ',
//                         ),
//                         validator: (value) =>
//                             CommonValidators.phoneValidator(value),
//                       ),
//                       const SizedBox(height: 24),

//                       // Login Button
//                       BlocBuilder<AuthCubit, AuthState>(
//                         bloc: getIt<AuthCubit>(),
//                         builder: (context, state) {
//                           final isLoading = state.maybeWhen(
//                             loading: () => true,
//                             orElse: () => false,
//                           );

//                           return ElevatedButton(
//                             onPressed: isLoading ? null : _handleLogin,
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: isLoading
//                                 ? const SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                       valueColor: AlwaysStoppedAnimation<Color>(
//                                           Colors.white),
//                                     ),
//                                   )
//                                 : const Text(
//                                     'Continue',
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 16),

//                       // Divider
//                       Row(
//                         children: [
//                           const Expanded(child: Divider()),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Text(
//                               'OR',
//                               style: TextStyle(color: Colors.grey[600]),
//                             ),
//                           ),
//                           const Expanded(child: Divider()),
//                         ],
//                       ),
//                       const SizedBox(height: 16),

//                       // Sign Up Link
//                       TextButton(
//                         onPressed: () => getIt<AppRouter>().router.push(AppRoutes.signup),
//                         child: const Text("Don't have an account? Sign Up"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleLogin() {
//     if (_formKey.currentState!.validate()) {
//       context.read<AuthCubit>().login(
//             phoneNumber: _phoneController.text.trim(),
//           );
//     }
//   }

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     super.dispose();
//   }
// }
