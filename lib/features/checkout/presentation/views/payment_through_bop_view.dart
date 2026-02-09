import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/checkout_stepper.dart';
import 'package:wasla/features/checkout/presentation/widgets/payment_header_bop.dart';
import 'package:wasla/features/checkout/presentation/widgets/payment_method_through_bop.dart';
import 'package:wasla/features/main_navigation/presentation/view_models/main_navigation_view_model.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';

class PaymentThroughBopView extends StatelessWidget {
  const PaymentThroughBopView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Consumer<PaymentViewModel>(
            builder:
                (context, paymentViewModel, child) =>
                    paymentViewModel.paymentCompleted
                        ? SizedBox.shrink()
                        : IconButton(
                          icon: Icon(
                            Icons.arrow_circle_right_outlined,
                            color: AppColors.lightPrimaryColor,
                          ),
                          onPressed: () {
                            paymentViewModel.setStepperIndex(index: 1);
                            paymentViewModel.cancelPaymentProcess();
                            Navigator.pop(context);
                          },
                        ),
          ),
        ],
        title: Text(
          'الدفع من خلال بنك فلسطين',
          style: AppTextStyle.lightHeading1(layout),
        ),
        centerTitle: true,
      ),
      body: Consumer<PaymentViewModel>(
        builder: (context, vm, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: layout.xl),
            child: Column(
              children: [
                SizedBox(height: layout.md),
                CheckoutStepper(),
                SizedBox(height: layout.md),
                const PaymentHeaderBop(),
                SizedBox(height: layout.md),
                _buildDynamicContent(context, vm, layout),
                SizedBox(height: layout.md),
                _buildBottomAction(vm, layout),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDynamicContent(
    BuildContext context,
    PaymentViewModel vm,
    AppLayout layout,
  ) {
    if (vm.paymentCompleted) {
      return Consumer3<
        CartViewModel,
        MainNavigationViewModel,
        ProductViewModel
      >(
        builder:
            (
              context,
              cartViewModel,
              mainNavigationViewModel,
              productViewModel,
              child,
            ) => Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.lightPrimaryColor,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: layout.fontXLarge * 1.5,
                    ),
                  ),
                  SizedBox(height: layout.md),
                  Text(
                    'تم الدفع بنجاح',
                    style: AppTextStyle.lightHeading1(layout),
                  ),
                  Spacer(flex: 1),
                  CustomElevatedButtonWidget(
                    onPressed: () {
                      cartViewModel.removeItem(
                        productViewModel.selectedProduct!.name,
                      );
                      mainNavigationViewModel.reset();
                      GoRouter.of(context).goNamed(AppRouter.homeView);
                      vm.reset();
                    },
                    title: 'الانتقال للصفحة الرئيسية',
                  ),
                  Spacer(flex: 4),
                ],
              ),
            ),
      );
    }

    if (vm.isRedirectedToBank) {
      return SpinKitFadingCircle(
        color: const Color(0xFF949292),
        size: ScreenSize.h(context) * 0.12,
      );
    }

    return const PaymentMethodThroughBop();
  }

  Widget _buildBottomAction(PaymentViewModel vm, AppLayout layout) {
    if (vm.isRedirectedToBank && !vm.paymentCompleted) {
      return Text(
        '! يرجى عدم اغلاق الصفحة',
        style: AppTextStyle.lightBody(layout),
      );
    }

    if (vm.paymentCompleted) return const SizedBox.shrink();

    return CustomElevatedButtonWidget(
      onPressed: () async {
        vm.startPaymentFlow();
      },
      title: 'الانتقال الى بنك فلسطين',
    );
  }
}
