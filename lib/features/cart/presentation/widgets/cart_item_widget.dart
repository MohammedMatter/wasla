import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
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
            margin: EdgeInsets.only(bottom: layout.sm),
            padding: EdgeInsets.all(layout.xs),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(layout.rmd),
              border: Border.all(
                color: AppColors.lightPrimaryColor.withOpacity(0.5),
                width: 1.2,
              ),
              color: const Color(0xffeef4f4),
            ),
            child: Row(
              children: [
                IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.all(layout.xs),
                  icon: Icon(Icons.close, size: layout.md),
                  color: Colors.redAccent,
                  onPressed: onRemoveItem,
                ),

                SizedBox(width: layout.xs),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(layout.rsm),
                  ),
                  child: Row(
                    children: [
                      _buildQuantityBtn(
                        text: "-",
                        onTap: onRemove,
                        layout: layout,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: layout.sm),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Text(
                          item.quantity.toString(),
                          style: TextStyle(
                            fontSize: layout.fontSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildQuantityBtn(
                        text: "+",
                        onTap: onAdd,
                        layout: layout,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: layout.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.product.name,
                          style: AppTextStyle.lightBody(layout).copyWith(
                            fontSize: layout.fontSmall,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: layout.xs / 2),
                        Text(
                          item.product.price,
                          style: TextStyle(
                            color: AppColors.lightPrimaryColor,
                            fontSize: layout.fontSmall,
                            fontWeight: FontWeight.w600,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: layout.xl * 1.8,
                  width: layout.xl * 1.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(layout.rsm),
                    child: Image.network(
                      item.product.image,
                      fit: BoxFit.cover,

                      color: const Color(0xffeef4f4),
                      colorBlendMode: BlendMode.multiply,
                      errorBuilder:
                          (context, _, __) =>
                              Icon(Icons.medication, size: layout.lg),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildQuantityBtn({
    required String text,
    required VoidCallback onTap,
    required AppLayout layout,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(layout.rsm),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layout.sm,
          vertical: layout.xs / 2,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: layout.fontMedium,
            fontWeight: FontWeight.w500,
            color: AppColors.lightPrimaryColor,
          ),
        ),
      ),
    );
  }
}
