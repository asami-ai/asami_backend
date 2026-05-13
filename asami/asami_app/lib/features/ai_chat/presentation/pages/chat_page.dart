
import 'package:asami_client/asami_client.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/navigation_shell.dart';

class ChatPage extends StatefulWidget {
  final UserType userType;

  const ChatPage({
    super.key,
    required this.userType,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();
  List<Map<String, dynamic>> get _messages => [
    {
      'text': widget.userType == UserType.vendor
          ? 'Hello! I\'m your AI assistant. How can I help you manage your store today?'
          : 'Hello! I\'m your AI shopping assistant. How can I help you find what you\'re looking for?',
      'isUser': false,
      'timestamp': DateTime.now(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isVendor = widget.userType == UserType.vendor;
    
    return ScaffoldWithNavigation(
      title: 'AI Assistant',
      body: Column(
        children: [
          // Context Indicator
          Container(
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                Icon(
                  isVendor ? Icons.store : Icons.shopping_bag,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  isVendor ? 'Vendor Assistant' : 'Shopping Assistant',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Suggested Actions
          if (_messages.length == 1)
            _SuggestedActions(isVendor: isVendor, onActionTap: _handleSuggestedAction),
          
          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _MessageBubble(
                  text: message['text'],
                  isUser: message['isUser'],
                  timestamp: message['timestamp'],
                );
              },
            ),
          ),
          
          // Input Field
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSuggestedAction(String action) {
    _messageController.text = action;
    _sendMessage();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add({
        'text': _messageController.text,
        'isUser': true,
        'timestamp': DateTime.now(),
      });
      
      // Simulate AI response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            'text': _getAIResponse(_messageController.text),
            'isUser': false,
            'timestamp': DateTime.now(),
          });
        });
      });
      
      _messageController.clear();
    });
  }

  String _getAIResponse(String userMessage) {
    final isVendor = widget.userType == UserType.vendor;
    
    if (userMessage.toLowerCase().contains('sales')) {
      return isVendor
          ? 'Your total sales for this month are \$12,456.78, up 15% from last month.'
          : 'I found some great deals on electronics! Would you like to see them?';
    }
    
    if (userMessage.toLowerCase().contains('inventory')) {
      return 'You have 8 products with low stock levels. Would you like me to show them to you?';
    }
    
    return isVendor
        ? 'I can help you with inventory management, order processing, sales analytics, and more. What would you like to know?'
        : 'I can help you find products, track orders, or answer questions about items. What are you looking for?';
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

class _SuggestedActions extends StatelessWidget {
  final bool isVendor;
  final Function(String) onActionTap;

  const _SuggestedActions({
    required this.isVendor,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final suggestions = isVendor
        ? [
            'Show my sales summary',
            'Which products are low in stock?',
            'Show pending orders',
            'What are my top selling products?',
          ]
        : [
            'Show me trending products',
            'Find electronics under \$100',
            'Track my recent order',
            'What\'s on sale today?',
          ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggested',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: suggestions.map((suggestion) {
              return ActionChip(
                label: Text(suggestion),
                onPressed: () => onActionTap(suggestion),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  const _MessageBubble({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.smart_toy,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          if (!isUser) const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(timestamp),
                    style: TextStyle(
                      fontSize: 10,
                      color: isUser ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 8),
          if (isUser)
            CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.person, size: 18, color: Colors.white),
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    }
  }
}