import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/payment_methodd_via_bank_of_palestine.dart';

class PaymentMethodThroughBop extends StatelessWidget {
  const PaymentMethodThroughBop({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(height: layout.xl * 1.6),
        Text('اختر طريقة الدفع', style: AppTextStyle.lightHeading1(layout)),
        SizedBox(height: layout.md),
        Consumer<PaymentViewModel>(
          builder:
              (context, paymentViewModel, child) => Column(
                children: [
                  PaymentMethodViaBankOfPalestine(
                    title: 'حساب بنكي',
                    onTap: () {
                      paymentViewModel.selectPaymentViaBopMethod(0);
                    },
                    isSelected:
                        paymentViewModel.selectedPaymentMethodViaBopIndex == 0,
                  ),
                  PaymentMethodViaBankOfPalestine(
                    isSelected:
                        paymentViewModel.selectedPaymentMethodViaBopIndex == 1,
                    onTap: () {
                      paymentViewModel.selectPaymentViaBopMethod(1);
                    },

                    title: 'بطاقة فيزا',
                  ),
                ],
              ),
        ),
      ],
    );
  }
}
