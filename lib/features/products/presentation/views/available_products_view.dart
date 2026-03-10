import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/products/presentation/widgets/available_products_body.dart';

class AvailableProductsView extends StatelessWidget {
  const AvailableProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('تصفح المنتجات', style: AppTextStyle.lightHeading1(layout)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.lightPrimaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: AvailableProductsBody(layout: layout),
    );
  }
}
