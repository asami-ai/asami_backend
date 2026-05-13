
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/routes.dart';

class WithdrawalPage extends StatefulWidget {
  const WithdrawalPage({super.key});

  @override
  State<WithdrawalPage> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  String _selectedMethod = 'bank';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw Funds'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Available Balance
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Balance',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$12,456.78',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Amount
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Withdrawal Amount',
                border: OutlineInputBorder(),
                prefixText: '\$ ',
                hintText: '0.00',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                final amount = double.tryParse(value);
                if (amount == null || amount <= 0) {
                  return 'Please enter valid amount';
                }
                if (amount > 12456.78) {
                  return 'Insufficient balance';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            // Quick Amount Buttons
            Wrap(
              spacing: 8,
              children: [
                _QuickAmountButton(
                  amount: '100',
                  onTap: () => _amountController.text = '100',
                ),
                _QuickAmountButton(
                  amount: '500',
                  onTap: () => _amountController.text = '500',
                ),
                _QuickAmountButton(
                  amount: '1000',
                  onTap: () => _amountController.text = '1000',
                ),
                _QuickAmountButton(
                  amount: 'All',
                  onTap: () => _amountController.text = '12456.78',
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Withdrawal Method
            Text(
              'Withdrawal Method',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            
            _MethodCard(
              title: 'Bank Transfer',
              subtitle: 'Account ending in ****1234',
              value: 'bank',
              groupValue: _selectedMethod,
              onChanged: (value) => setState(() => _selectedMethod = value!),
            ),
            _MethodCard(
              title: 'PayPal',
              subtitle: 'user@example.com',
              value: 'paypal',
              groupValue: _selectedMethod,
              onChanged: (value) => setState(() => _selectedMethod = value!),
            ),
            _MethodCard(
              title: 'Mobile Money',
              subtitle: '+1 234 567 8900',
              value: 'mobile',
              groupValue: _selectedMethod,
              onChanged: (value) => setState(() => _selectedMethod = value!),
            ),
            const SizedBox(height: 24),
            
            // Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Withdrawals are processed within 1-3 business days',
                      style: TextStyle(fontSize: 13, color: Colors.blue.shade700),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Submit Button
            ElevatedButton(
              onPressed: _submitWithdrawal,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Request Withdrawal'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitWithdrawal() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Withdrawal'),
          content: Text(
            'Withdraw \$${_amountController.text} to ${_selectedMethod == 'bank' ? 'Bank Account' : _selectedMethod == 'paypal' ? 'PayPal' : 'Mobile Money'}?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context.go(VendorRoutes.wallet);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Withdrawal request submitted')),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}

class _QuickAmountButton extends StatelessWidget {
  final String amount;
  final VoidCallback onTap;

  const _QuickAmountButton({
    required this.amount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(amount == 'All' ? amount : '\$$amount'),
      onPressed: onTap,
    );
  }
}

class _MethodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  const _MethodCard({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: RadioListTile<String>(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
