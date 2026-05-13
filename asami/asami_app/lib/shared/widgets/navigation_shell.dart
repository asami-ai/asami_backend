// ============================================================================
// NAVIGATION SHELL - Main scaffold with bottom navigation
// ============================================================================

import 'package:asami_client/asami_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/navigation_helper.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';

// ═══════════════════════════════════════════════════════════
// NAVIGATION SHELL - Wraps main pages with bottom nav
// ═══════════════════════════════════════════════════════════

class NavigationShell extends StatefulWidget {
  final Widget child;
  final String currentRoute;

  const NavigationShell({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return authState.maybeWhen(
          orElse: () => widget.child,
          authenticated: (user) {
            final isVendor = user.userType == UserType.vendor;

            return Scaffold(
              body: widget.child,
              bottomNavigationBar: _buildBottomNav(context, isVendor),
              drawer: _buildDrawer(context, user),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomNav(BuildContext context, bool isVendor) {
    final items = isVendor ? VendorNavItems.items : BuyerNavItems.items;
    final routes = isVendor ? VendorNavItems.routes : BuyerNavItems.routes;
    final currentIndex = isVendor
        ? VendorNavItems.getIndexForRoute(widget.currentRoute)
        : BuyerNavItems.getIndexForRoute(widget.currentRoute);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      items: items,
      onTap: (index) {
        if (index != currentIndex) {
          context.go(routes[index]);
        }
      },
    );
  }

  Widget? _buildDrawer(BuildContext context, User user) {
    final isVendor = user.userType == UserType.vendor;
    final drawerItems =
        isVendor ? VendorDrawerItems.items : BuyerDrawerItems.items;

    if (drawerItems.isEmpty) return null;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(context, user),
          const Divider(),
          ...drawerItems.map((item) => _buildDrawerItem(context, item)),
          const Divider(),
          _buildLogoutTile(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context, User user) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: user.profileImageUrl != null
            ? NetworkImage(user.profileImageUrl!)
            : null,
        child: user.profileImageUrl == null
            ? Text(
                user.firstName?.substring(0, 1).toUpperCase() ?? 'U',
                style: const TextStyle(fontSize: 32),
              )
            : null,
      ),
      accountName: Text(
        '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim().isEmpty
            ? 'User'
            : '${user.firstName ?? ''} ${user.lastName ?? ''}',
      ),
      accountEmail: Text(user.email ?? user.phoneNumber),
    );
  }

  Widget _buildDrawerItem(BuildContext context, DrawerItem item) {
    return ListTile(
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: () {
        Navigator.pop(context); // Close drawer
        context.go(item.route);
      },
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const Text(
        'Logout',
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {
        _showLogoutDialog(context);
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext); // Close dialog
              Navigator.pop(context); // Close drawer
              context.read<AuthCubit>().logout();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SCAFFOLD WITH NAVIGATION - For individual pages
// ═══════════════════════════════════════════════════════════

class ScaffoldWithNavigation extends StatelessWidget {
  final Widget body;
  final String title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showAppBar;

  const ScaffoldWithNavigation({
    super.key,
    required this.body,
    required this.title,
    this.actions,
    this.floatingActionButton,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(title),
              actions: actions,
            )
          : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
