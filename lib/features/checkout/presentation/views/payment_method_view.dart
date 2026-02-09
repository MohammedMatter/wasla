import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/checkout_stepper.dart';
import 'package:wasla/features/checkout/presentation/widgets/payment_method_item.dart';

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
      body: Consumer<PaymentViewModel>(
        builder:
            (context, paymentViewModel, child) => Padding(
              padding: EdgeInsets.symmetric(horizontal: layout.md),
              child: Column(
                children: [
                  SizedBox(height: layout.md),
                  CheckoutStepper(),
                  SizedBox(height: layout.xl),
                  Column(
                    children: [
                      PaymentMethodItem(
                        layout: layout,
                        title: 'بنك فلسطين',
                        imagePath: 'assets/images/payment_method/palestine.png',
                        isSelected:
                            paymentViewModel.selectedPaymentMethodIndex == 0,
                        onTap: () {
                          paymentViewModel.selectPaymentMethod(0);
                        },
                      ),
                      PaymentMethodItem(
                        isSelected:
                            paymentViewModel.selectedPaymentMethodIndex == 1,
                        onTap: () {
                          paymentViewModel.selectPaymentMethod(1);
                        },
                        layout: layout,
                        title: 'Jawwal Pay',
                        imagePath:
                            'assets/images/payment_method/jawwal_pay.png',
                      ),
                      PaymentMethodItem(
                        layout: layout,
                        title: 'الدفع عند الاستلام',
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
                  Spacer(flex: 1),
                  CustomElevatedButtonWidget(
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRouter.paymentThroughBopView);
                    },
                    title: 'اتمام الدفع',
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
      ),
    );
  }
}
