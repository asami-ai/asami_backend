
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/routes.dart';
import '../../../../../shared/widgets/navigation_shell.dart';

class VendorOrdersListPage extends StatefulWidget {
  const VendorOrdersListPage({super.key});

  @override
  State<VendorOrdersListPage> createState() => _VendorOrdersListPageState();
}

class _VendorOrdersListPageState extends State<VendorOrdersListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
      title: 'Orders',
      body: Column(
        children: [
          // Tabs
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Pending'),
              Tab(text: 'Processing'),
              Tab(text: 'Shipped'),
              Tab(text: 'Completed'),
            ],
          ),
          
          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _OrdersList(status: 'all'),
                _OrdersList(status: 'pending'),
                _OrdersList(status: 'processing'),
                _OrdersList(status: 'shipped'),
                _OrdersList(status: 'completed'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _OrdersList extends StatelessWidget {
  final String status;

  const _OrdersList({required this.status});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 15,
        itemBuilder: (context, index) {
          return _OrderCard(
            orderId: 'order-${1234 + index}',
            orderNumber: '#${1234 + index}',
            customerName: 'Customer ${index + 1}',
            items: 2 + index % 3,
            total: 45.99 * (index + 1),
            status: _getOrderStatus(index),
            date: '${index + 1} hours ago',
          );
        },
      ),
    );
  }

  String _getOrderStatus(int index) {
    final statuses = ['pending', 'processing', 'shipped', 'completed', 'cancelled'];
    return statuses[index % statuses.length];
  }
}

class _OrderCard extends StatelessWidget {
  final String orderId;
  final String orderNumber;
  final String customerName;
  final int items;
  final double total;
  final String status;
  final String date;

  const _OrderCard({
    required this.orderId,
    required this.orderNumber,
    required this.customerName,
    required this.items,
    required this.total,
    required this.status,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => context.go(VendorRoutes.orderDetail(orderId)),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderNumber,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _StatusBadge(status: status),
                ],
              ),
              const SizedBox(height: 12),
              
              // Customer Info
              Row(
                children: [
                  const Icon(Icons.person_outline, size: 16),
                  const SizedBox(width: 8),
                  Text(customerName),
                ],
              ),
              const SizedBox(height: 8),
              
              // Order Details
              Row(
                children: [
                  const Icon(Icons.shopping_bag_outlined, size: 16),
                  const SizedBox(width: 8),
                  Text('$items items'),
                  const SizedBox(width: 24),
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 8),
                  Text(date),
                ],
              ),
              const SizedBox(height: 12),
              
              // Total and Action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (status == 'pending')
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text('Process'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor();
    final text = status.toUpperCase();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'processing':
        return Colors.blue;
      case 'shipped':
        return Colors.purple;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
