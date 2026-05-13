
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  String _selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _FilterChip(
                  label: 'All',
                  value: 'all',
                  selectedValue: _selectedFilter,
                  onSelected: (value) => setState(() => _selectedFilter = value),
                ),
                _FilterChip(
                  label: 'Credits',
                  value: 'credit',
                  selectedValue: _selectedFilter,
                  onSelected: (value) => setState(() => _selectedFilter = value),
                ),
                _FilterChip(
                  label: 'Debits',
                  value: 'debit',
                  selectedValue: _selectedFilter,
                  onSelected: (value) => setState(() => _selectedFilter = value),
                ),
                _FilterChip(
                  label: 'Pending',
                  value: 'pending',
                  selectedValue: _selectedFilter,
                  onSelected: (value) => setState(() => _selectedFilter = value),
                ),
              ],
            ),
          ),
          
          // Transactions List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 20,
              itemBuilder: (context, index) {
                final isCredit = index % 3 != 2;
                final isPending = index % 5 == 0;
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isPending
                          ? Colors.orange.shade50
                          : isCredit
                              ? Colors.green.shade50
                              : Colors.red.shade50,
                      child: Icon(
                        isPending
                            ? Icons.pending
                            : isCredit
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                        color: isPending
                            ? Colors.orange
                            : isCredit
                                ? Colors.green
                                : Colors.red,
                      ),
                    ),
                    title: Text(
                      isPending
                          ? 'Pending Payment'
                          : isCredit
                              ? 'Order Payment #${1234 + index}'
                              : 'Withdrawal',
                    ),
                    subtitle: Text(
                      '${index + 1} days ago${isPending ? ' • Processing' : ''}',
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${isCredit ? '+' : '-'}\$${(123.45 * (index + 1)).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isPending
                                ? Colors.orange
                                : isCredit
                                    ? Colors.green
                                    : Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        if (isPending)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'PENDING',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () => _showTransactionDetails(context, index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Transactions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Date Range'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Amount Range'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Transaction Type'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _showTransactionDetails(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _DetailRow(label: 'Transaction ID', value: 'TXN${1000 + index}'),
            _DetailRow(label: 'Date', value: '${index + 1} days ago'),
            _DetailRow(label: 'Amount', value: '\$${(123.45 * (index + 1)).toStringAsFixed(2)}'),
            _DetailRow(label: 'Type', value: index % 3 != 2 ? 'Credit' : 'Debit'),
            _DetailRow(label: 'Status', value: index % 5 == 0 ? 'Pending' : 'Completed'),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String value;
  final String selectedValue;
  final Function(String) onSelected;

  const _FilterChip({
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selectedValue == value,
        onSelected: (_) => onSelected(value),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}