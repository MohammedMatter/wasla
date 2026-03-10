import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/payment_method_body.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Consumer<PaymentViewModel>(
            builder:
                (context, paymentViewModel, child) => IconButton(
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: AppColors.lightPrimaryColor,
                  ),
                  onPressed: () {
                    paymentViewModel.setStepperIndex(index: 0);
                    Navigator.pop(context);
                  },
                ),
          ),
        ],
        title: Text('طريقة الدفع', style: AppTextStyle.lightHeading1(layout)),
        centerTitle: true,
      ),
      body: PaymentMethodBody(),
    );
  }
}
