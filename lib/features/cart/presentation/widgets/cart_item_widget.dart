import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/features/cart/domain/cart_item.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final bool isSelected;
  final int quantity;
  final Function() onAdd;
  final Function() onRemove;
  final Function() onRemoveItem;
  const CartItemWidget({
    super.key,
    required this.onRemoveItem,
    required this.onAdd,
    required this.onRemove,
    required this.quantity,

    required this.item,

    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Consumer<CartViewModel>(
      builder:
          (context, cartViewModel, child) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(layout.rmd),
              border: Border.all(
                color: AppColors.lightPrimaryColor,
                width: 1.2,
              ),
              color: Color(0xffeef4f4),
            ),
            child: Row(
              children: [
                // زر الحذف X
                IconButton(
                  icon: Icon(Icons.close, size: 20),
                  color: Colors.red,
                  onPressed: () => onRemoveItem(),
                ),
                const SizedBox(width: 10),
                // التحكم في الكمية +-
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => onRemove(),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text("-", style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Text(item.quantity.toString()),
                      ),
                      InkWell(
                        onTap: () => onAdd(),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text("+", style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // تفاصيل المنتج
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.product.price,
                      style: const TextStyle(color: Color(0xFF269A99)),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: layout.xl * 2.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.product.image,
                      color: Color(0xffeef4f4),
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
