import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/payment_method_item.dart';

import 'checkout_stepper.dart';

class PaymentMethodBody extends StatelessWidget {
  const PaymentMethodBody({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Consumer<PaymentViewModel>(
      builder:
          (context, paymentViewModel, child) => Padding(
            padding: EdgeInsets.symmetric(horizontal: layout.md),
            child: Column(
              children: [
                SizedBox(height: layout.md),
                const CheckoutStepper(),
                SizedBox(height: layout.xl),
                Column(
                  children: [
                    PaymentMethodItem(
                      layout: layout,
                      title: LangKeys.bankOfPalestine.tr(),
                      imagePath: 'assets/images/payment_method/palestine.png',
                      isSelected:
                          paymentViewModel.selectedPaymentMethodIndex == 0,
                      onTap: () {
                        paymentViewModel.selectPaymentMethod(0);
                      },
                    ),
                    PaymentMethodItem(
                      layout: layout,
                      title: LangKeys.jawwalPay.tr(),
                      imagePath: AppAssest.jawwalPay,
                      isSelected:
                          paymentViewModel.selectedPaymentMethodIndex == 1,
                      onTap: () {
                        paymentViewModel.selectPaymentMethod(1);
                      },
                    ),
                    PaymentMethodItem(
                      layout: layout,
                      title: LangKeys.cashOnDelivery.tr(),
                      imagePath:
                          'assets/images/payment_method/manual_receipt.png',
                      isSelected:
                          paymentViewModel.selectedPaymentMethodIndex == 2,
                      onTap: () {
                        paymentViewModel.selectPaymentMethod(2);
                      },
                    ),
                  ],
                ),
                SizedBox(height: layout.xl),
                const Spacer(flex: 1),
                CustomElevatedButtonWidget(
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushNamed(AppRouter.paymentThroughBopView);
                  },
                  title: LangKeys.completePayment.tr(),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
    );
  }
}
