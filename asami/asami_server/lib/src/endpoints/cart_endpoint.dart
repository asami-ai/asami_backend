// File: server/lib/src/endpoints/cart_endpoint.dart

import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class CartEndpoint extends Endpoint {
  /// Get or create cart for customer
  Future<Cart?> getOrCreateCart(
    Session session,
    UuidValue customerId,
  ) async {
    // Try to find active cart
    var cart = await Cart.db.findFirstRow(
      session,
      where: (t) => t.customerId.equals(customerId) & t.isActive.equals(true),
    );

    if (cart != null) return cart;

    // Create new cart
    final cartId = Uuid().v4obj();
    cart = Cart(
      id: cartId,
      customerId: customerId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await Cart.db.insertRow(session, cart);
  }

  /// Add item to cart
  Future<CartItem?> addToCart(
    Session session, {
    required UuidValue customerId,
    required UuidValue productId,
    UuidValue? variantId,
    int quantity = 1,
    String? customerNotes,
  }) async {
    try {
      final cart = await getOrCreateCart(session, customerId);
      if (cart == null) return null;

      // Check if item already exists
      var existingItem = await CartItem.db.findFirstRow(
        session,
        where: (t) => 
            t.cartId.equals(cart.id) & 
            t.productId.equals(productId) &
            (variantId != null ? t.variantId.equals(variantId) : t.variantId.equals(null)),
      );

      if (existingItem != null) {
        // Update quantity
        existingItem.quantity += quantity;
        existingItem.subtotal = existingItem.unitPrice * existingItem.quantity;
        existingItem.updatedAt = DateTime.now();
        await CartItem.db.updateRow(session, existingItem);
        await _updateCartTotals(session, cart.id);
        return existingItem;
      }

      // Get product price
      final product = await Product.db.findFirstRow(
        session,
        where: (t) => t.id.equals(productId),
      );

      if (product == null) return null;

      final unitPrice = product.discountPrice ?? product.basePrice;

      // Create new cart item
      final cartItem = CartItem(
        cartId: cart.id,
        productId: productId,
        variantId: variantId,
        quantity: quantity,
        unitPrice: unitPrice,
        subtotal: unitPrice * quantity,
        customerNotes: customerNotes,
        addedAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final created = await CartItem.db.insertRow(session, cartItem);
      await _updateCartTotals(session, cart.id);

      return created;
    } catch (e) {
      session.log('Add to cart error: $e');
      return null;
    }
  }

  /// Update cart item quantity
  Future<bool> updateCartItemQuantity(
    Session session, {
    required int cartItemId,
    required int quantity,
  }) async {
    if (quantity <= 0) return false;

    final item = await CartItem.db.findById(session, cartItemId);
    if (item == null) return false;

    item.quantity = quantity;
    item.subtotal = item.unitPrice * quantity;
    item.updatedAt = DateTime.now();

    await CartItem.db.updateRow(session, item);
    await _updateCartTotals(session, item.cartId);

    return true;
  }

  /// Remove item from cart
  Future<bool> removeFromCart(Session session, int cartItemId) async {
    final item = await CartItem.db.findById(session, cartItemId);
    if (item == null) return false;

    final cartId = item.cartId;
    await CartItem.db.deleteRow(session, item);
    await _updateCartTotals(session, cartId);

    return true;
  }

  /// Get cart with items
  Future<Map<String, dynamic>?> getCartWithItems(
    Session session,
    UuidValue customerId,
  ) async {
    final cart = await getOrCreateCart(session, customerId);
    if (cart == null) return null;

    final items = await CartItem.db.find(
      session,
      where: (t) => t.cartId.equals(cart.id),
    );

    return {
      'cart': cart,
      'items': items,
    };
  }

  /// Clear cart
  Future<bool> clearCart(Session session, UuidValue customerId) async {
    final cart = await Cart.db.findFirstRow(
      session,
      where: (t) => t.customerId.equals(customerId) & t.isActive.equals(true),
    );

    if (cart == null) return false;

    // Delete all items
    await CartItem.db.deleteWhere(
      session,
      where: (t) => t.cartId.equals(cart.id),
    );

    // Reset cart totals
    cart.itemCount = 0;
    cart.subtotal = 0.0;
    cart.updatedAt = DateTime.now();
    await Cart.db.updateRow(session, cart);

    return true;
  }

  // Helper method
  Future<void> _updateCartTotals(Session session, UuidValue cartId) async {
    final items = await CartItem.db.find(
      session,
      where: (t) => t.cartId.equals(cartId),
    );

    final cart = await Cart.db.findFirstRow(
      session,
      where: (t) => t.id.equals(cartId),
    );

    if (cart == null) return;

    cart.itemCount = items.length;
    cart.subtotal = items.fold(0.0, (sum, item) => sum + item.subtotal);
    cart.updatedAt = DateTime.now();

    await Cart.db.updateRow(session, cart);
  }
}

