import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wasla/features/cart/presentation/widgets/cart_item_widget.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Consumer<CartViewModel>(
      builder: (context, cartViewModel, child) {
        final cartItems = cartViewModel.items.values.toList();

        return Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            padding: EdgeInsets.all(layout.md),
            itemBuilder: (context, index) {
              final item = cartItems[index];

              return CartItemWidget(
                item: item,
                quantity: item.quantity,
                onAdd: () {
                  cartViewModel.addToCart(item.product);
                },
                onRemove:
                    () => cartViewModel.removeSingleItem(item.product.name),
                onRemoveItem: () => cartViewModel.removeItem(item.product.name),
              );
            },
          ),
        );
      },
    );
  }
}
