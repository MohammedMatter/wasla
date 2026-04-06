import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/step_circle.dart';
import 'package:wasla/features/checkout/presentation/widgets/step_line.dart';

class CheckoutStepper extends StatelessWidget {
  const CheckoutStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentViewModel>(
      builder:
          (context, paymentViewModel, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StepCircle(
                title: LangKeys.addressTitle.tr(),
                isCompleted: paymentViewModel.steppterIndex >= 0,
              ),
              StepLine(),

              StepCircle(
                title: LangKeys.stepPayment.tr(),
                isCompleted: paymentViewModel.steppterIndex >= 1,
              ),
              StepLine(),
              StepCircle(
                title: LangKeys.stepConfirmation.tr(),
                isCompleted: paymentViewModel.steppterIndex >= 2,
              ),
            ],
          ),
    );
  }
}
