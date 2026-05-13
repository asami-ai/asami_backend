
import 'package:flutter/material.dart';

class OrderTrackingPage extends StatelessWidget {
  final String orderId;

  const OrderTrackingPage({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Order Info Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order #1234',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'IN TRANSIT',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.local_shipping, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text('Estimated Delivery: Dec 25, 2024'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Tracking Timeline
          _TrackingTimeline(
            steps: [
              TrackingStep(
                title: 'Order Placed',
                subtitle: 'Your order has been placed',
                time: 'Dec 20, 10:30 AM',
                isCompleted: true,
              ),
              TrackingStep(
                title: 'Order Confirmed',
                subtitle: 'Seller confirmed your order',
                time: 'Dec 20, 11:00 AM',
                isCompleted: true,
              ),
              TrackingStep(
                title: 'Processing',
                subtitle: 'Order is being prepared',
                time: 'Dec 21, 9:00 AM',
                isCompleted: true,
              ),
              TrackingStep(
                title: 'Shipped',
                subtitle: 'Package handed to courier',
                time: 'Dec 22, 2:00 PM',
                isCompleted: true,
              ),
              TrackingStep(
                title: 'Out for Delivery',
                subtitle: 'Package is on the way',
                time: 'Dec 24, 8:00 AM',
                isCompleted: false,
                isCurrent: true,
              ),
              TrackingStep(
                title: 'Delivered',
                subtitle: 'Package delivered successfully',
                time: 'Pending',
                isCompleted: false,
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Tracking Number
          Card(
            child: ListTile(
              leading: const Icon(Icons.confirmation_number),
              title: const Text('Tracking Number'),
              subtitle: const Text('TRK123456789'),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tracking number copied')),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrackingStep {
  final String title;
  final String subtitle;
  final String time;
  final bool isCompleted;
  final bool isCurrent;

  TrackingStep({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isCompleted,
    this.isCurrent = false,
  });
}

class _TrackingTimeline extends StatelessWidget {
  final List<TrackingStep> steps;

  const _TrackingTimeline({required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isLast = index == steps.length - 1;
        
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: step.isCompleted || step.isCurrent
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300],
                  ),
                  child: Icon(
                    step.isCompleted
                        ? Icons.check
                        : step.isCurrent
                            ? Icons.location_on
                            : Icons.circle,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 60,
                    color: step.isCompleted ? Theme.of(context).colorScheme.primary : Colors.grey[300],
                  ),
              ],
            ),
            const SizedBox(width: 16),
            
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: step.isCurrent ? FontWeight.bold : FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step.subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step.time,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}