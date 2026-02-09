import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/step_circle.dart';
import 'package:wasla/features/checkout/presentation/widgets/step_line.dart';

class CheckoutStepper extends StatelessWidget {
  CheckoutStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentViewModel>(
      builder:
          (context, paymentViewModel, child) => Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StepCircle(
                title: "العنوان",
                isCompleted: paymentViewModel.steppterIndex >= 0,
              ),
              StepLine(),

              StepCircle(
                title: "الدفع",
                isCompleted: paymentViewModel.steppterIndex >= 1,
              ),
              StepLine(),
              StepCircle(
                title: "التأكيد",
                isCompleted: paymentViewModel.steppterIndex >= 2,
              ),
            ],
          ),
    );
  }
}
