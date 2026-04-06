import 'package:flutter/material.dart';
import 'package:wasla/features/cart/domain/cart_item.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class CartViewModel extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => {..._items};
  bool isLoading = false;

  Future<void> addToCart(Product product) async {
    isLoading = true;
    notifyListeners();
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(product: product, quantity: 1),
      );
    }
    await Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
    });
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product.id);
    notifyListeners();
  }

  void removeSingleItem(Product product) {
    if (!_items.containsKey(product.id)) return;

    if (_items[product.id]!.quantity > 1) {
      _items.update(
        product.id,
        (existing) => CartItem(
          product: existing.product,
          quantity: existing.quantity - 1,
        ),
      );
    } else {
      _items.remove(product.id);
    }
    notifyListeners();
  }

  int get itemCount => _items.length;

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total +=
          double.parse(cartItem.product.price.split(' ')[0]) *
          cartItem.quantity;
    });
    return total;
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
