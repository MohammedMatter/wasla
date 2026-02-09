import 'package:flutter/material.dart';
import 'package:wasla/features/cart/domain/cart_item.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

class CartViewModel extends ChangeNotifier {
  // مخزن السلة: المفتاح هو الـ ID والـ Value هي الـ CartItem
  final Map<String, CartItem> _items = {};

  // للوصول للسلة من الـ UI بدون التعديل عليها مباشرة
  Map<String, CartItem> get items => {..._items};
  bool isLoading = false;
  // 1. إضافة منتج للسلة
  Future<void> addToCart(Product product) async {
    isLoading = true;
    notifyListeners();
    if (_items.containsKey(product.name)) {
      _items.update(
        product.name,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      // إذا مش موجود، ضيفه كعنصر جديد
      _items.putIfAbsent(
        product.name,
        () => CartItem(product: product, quantity: 1),
      );
    }
    await Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
    });
    notifyListeners();
  }

  void removeItem(String productName) {
    _items.remove(productName);
    notifyListeners();
  }

  void removeSingleItem(String productName) {
    if (!_items.containsKey(productName)) return;

    if (_items[productName]!.quantity > 1) {
      _items.update(
        productName,
        (existing) => CartItem(
          product: existing.product,
          quantity: existing.quantity - 1,
        ),
      );
    } else {
      _items.remove(productName);
    }
    notifyListeners();
  }

  int get itemCount => _items.length;

  // 5. حساب السعر الإجمالي
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total +=
          double.parse(cartItem.product.price.split(' ')[0]) *
          cartItem.quantity;
    });
    return total;
  }

  // 6. مسح السلة بعد إتمام الطلب
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
