import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/auth/presentation/view_models/vervication_view_model.dart';

class VerificationCodeBody extends StatefulWidget {
  const VerificationCodeBody({super.key});

  @override
  State<VerificationCodeBody> createState() => _VerificationCodeBodyState();
}

class _VerificationCodeBodyState extends State<VerificationCodeBody> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );
  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Text(
              'أرسلنا لك رمز مكون من 5 أرقام على بريدك الالكتروني',
              textAlign: TextAlign.center,
              style: AppTextStyle.lightBody(
                layout,
              ).copyWith(color: const Color(0xff7E7575)),
            ),

            SizedBox(height: layout.xl),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => _buildOtpBox(context, index, layout),
                ),
              ),
            ),
            SizedBox(height: layout.xl),
            Consumer<VervicationViewModel>(
              builder:
                  (context, vervicationViewModel, child) =>
                      CustomElevatedButtonWidget(
                        isFilled: vervicationViewModel.isFilledColor,
                        onPressed: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRouter.resetPasswordView);
                        },
                        title: 'تأكيد الرمز',
                      ),
            ),

            SizedBox(height: layout.xl),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '(00:45) ',
                  style: AppTextStyle.lightBody(layout).copyWith(
                    color: AppColors.lightPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    ' إعادة الارسال ؟',
                    style: AppTextStyle.lightBody(
                      layout,
                    ).copyWith(color: AppColors.lightPrimaryColor),
                  ),
                ),
                Text(
                  ' لم يصلك الرمز ؟ ',
                  style: AppTextStyle.lightBody(
                    layout,
                  ).copyWith(color: const Color(0xff7E7575)),
                ),
              ],
            ),

            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(BuildContext context, int index, AppLayout layout) {
    return Consumer<VervicationViewModel>(
      builder:
          (context, vervicationViewModel, child) => Expanded(
            child: Padding(
              padding: EdgeInsets.all(layout.sm),
              child: TextField(
                textAlign: TextAlign.center,
                enabled: true,
                controller: _controllers[index],
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(layout.rmd),
                    borderSide: BorderSide(color: AppColors.lightPrimaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(layout.rmd),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 121, 116, 116),
                      width: 1.10,
                    ),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                onChanged: (value) {
                  if (index < _controllers.length - 1 && value.length == 1) {
                    FocusScope.of(context).nextFocus();
                    vervicationViewModel.toogleFilledColor(
                      isFilledColor: false,
                    );
                  } else if (value.isEmpty && index > 0) {
                    vervicationViewModel.toogleFilledColor(
                      isFilledColor: false,
                    );
                    FocusScope.of(context).previousFocus();
                  } else if (index == _controllers.length - 1) {
                    vervicationViewModel.toogleFilledColor(isFilledColor: true);
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ),
          ),
    );
  }
}
