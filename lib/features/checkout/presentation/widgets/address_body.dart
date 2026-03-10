import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/address_form.dart';
import 'package:wasla/features/checkout/presentation/widgets/checkout_stepper.dart';

class AdddressBody extends StatelessWidget {
  const AdddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return SingleChildScrollView(
      padding: EdgeInsets.all(layout.md),
      child: Consumer<PaymentViewModel>(
        builder:
            (context, paymentViewModel, child) => Column(
              children: [
                CheckoutStepper(),
                SizedBox(height: layout.lg),
                AddressForm(),
                SizedBox(height: layout.xl),
                CustomElevatedButtonWidget(
                  onPressed: () {
                    paymentViewModel.setStepperIndex(index: 1);
                    GoRouter.of(context).pushNamed(AppRouter.paymentMethodView);
                  },
                  title: 'حفظ',
                ),
              ],
            ),
      ),
    );
  }
}
