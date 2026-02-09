import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/address_form.dart';
import 'package:wasla/features/checkout/presentation/widgets/checkout_stepper.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

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
                    Navigator.pop(context);
                  },
                ),
          ),
        ],
        title: Text('العنوان', style: AppTextStyle.lightHeading1(layout)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRouter.paymentMethodView);
                    },
                    title: 'حفظ',
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
