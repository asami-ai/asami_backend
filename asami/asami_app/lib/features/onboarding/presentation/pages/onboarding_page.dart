// // ============================================================================
// // ONBOARDING PAGE
// // Location: lib/features/onboarding/presentation/pages/onboarding_page.dart
// // ============================================================================

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/router/app_router.dart';
// import '../../../../core/router/routes.dart';

// class OnboardingPage extends StatefulWidget {
//   const OnboardingPage({super.key});

//   @override
//   State<OnboardingPage> createState() => _OnboardingPageState();
// }

// class _OnboardingPageState extends State<OnboardingPage> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   final List<OnboardingContent> _pages = [
//     OnboardingContent(
//       title: 'Welcome to Asami',
//       description: 'Your one-stop marketplace for buying and selling amazing products',
//       image: Icons.shopping_bag,
//       color: Colors.blue,
//     ),
//     OnboardingContent(
//       title: 'Shop with Ease',
//       description: 'Browse thousands of products from verified vendors with fast delivery',
//       image: Icons.storefront,
//       color: Colors.green,
//     ),
//     OnboardingContent(
//       title: 'Sell Your Products',
//       description: 'Start your business and reach thousands of customers in minutes',
//       image: Icons.store,
//       color: Colors.orange,
//     ),
//     OnboardingContent(
//       title: 'Secure Payments',
//       description: 'Safe and secure payment methods with buyer protection',
//       image: Icons.security,
//       color: Colors.purple,
//     ),
//   ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _onPageChanged(int page) {
//     setState(() {
//       _currentPage = page;
//     });
//   }

//   void _nextPage() {
//     if (_currentPage < _pages.length - 1) {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       _completeOnboarding();
//     }
//   }

//   void _skipOnboarding() {
//     _completeOnboarding();
//   }

//   Future<void> _completeOnboarding() async {
//     await AppRouter.markOnboardingCompleted();
//     if (mounted) {
//       context.go(AppRoutes.login);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Skip Button
//             Align(
//               alignment: Alignment.topRight,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: TextButton(
//                   onPressed: _skipOnboarding,
//                   child: const Text('Skip'),
//                 ),
//               ),
//             ),

//             // Page View
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: _onPageChanged,
//                 itemCount: _pages.length,
//                 itemBuilder: (context, index) {
//                   return _OnboardingPageContent(content: _pages[index]);
//                 },
//               ),
//             ),

//             // Indicators
//             Padding(
//               padding: const EdgeInsets.all(24),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   _pages.length,
//                   (index) => _buildIndicator(index),
//                 ),
//               ),
//             ),

//             // Next/Get Started Button
//             Padding(
//               padding: const EdgeInsets.all(24),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _nextPage,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: Text(
//                     _currentPage == _pages.length - 1
//                         ? 'Get Started'
//                         : 'Next',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildIndicator(int index) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       height: 8,
//       width: _currentPage == index ? 24 : 8,
//       decoration: BoxDecoration(
//         color: _currentPage == index
//             ? Theme.of(context).colorScheme.primary
//             : Colors.grey[300],
//         borderRadius: BorderRadius.circular(4),
//       ),
//     );
//   }
// }

// class _OnboardingPageContent extends StatelessWidget {
//   final OnboardingContent content;

//   const _OnboardingPageContent({required this.content});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Icon
//           Container(
//             width: 200,
//             height: 200,
//             decoration: BoxDecoration(
//               color: content.color.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               content.image,
//               size: 100,
//               color: content.color,
//             ),
//           ),
//           const SizedBox(height: 48),

//           // Title
//           Text(
//             content.title,
//             style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),

//           // Description
//           Text(
//             content.description,
//             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   color: Colors.grey[600],
//                   height: 1.5,
//                 ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingContent {
//   final String title;
//   final String description;
//   final IconData image;
//   final Color color;

//   OnboardingContent({
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.color,
//   });
// }