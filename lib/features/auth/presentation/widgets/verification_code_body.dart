import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:wasla/features/auth/presentation/view_models/vervication_view_model.dart';

// ignore: must_be_immutable
class VerificationCodeBody extends StatefulWidget {
  @override
  State<VerificationCodeBody> createState() => _VerificationCodeBodyState();
}

class _VerificationCodeBodyState extends State<VerificationCodeBody> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<VervicationViewModel>();
      vm.startTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLayout layout = AppLayout();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
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

              SizedBox(height: layout.md),
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
              SizedBox(height: layout.md),
              Consumer2<VervicationViewModel, AuthViewModel>(
                builder:
                    (
                      context,
                      vervicationViewModel,
                      authViewModel,
                      child,
                    ) => CustomElevatedButtonWidget(
                      isFilled: vervicationViewModel.isFilledColor,
                      onPressed:
                          vervicationViewModel.isFilledColor
                              ? () async {
                                for (var element in _controllers) {
                                  final otp = authViewModel.otpCode;
                                  if (element.text !=
                                      otp[_controllers.indexOf(element)]) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'الكود خطا , تاكد من الكود يلي بعتنالك ياه',
                                          style: AppTextStyle.lightBody(
                                            layout,
                                          ).copyWith(color: Colors.white),
                                        ),
                                      ),
                                    );
                                    return;
                                  }
                                }
                                showDialog(
                                  context: context,
                                  builder:
                                      (context) => Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.lightPrimaryColor,
                                        ),
                                      ),
                                );
                                await Future.delayed(
                                  const Duration(seconds: 2),
                                );
                                Navigator.of(context).pop();
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRouter.resetPasswordView);
                              }
                              : null,
                      title: 'تأكيد الرمز',
                    ),
              ),

              SizedBox(height: layout.xl),
              Consumer2<VervicationViewModel, AuthViewModel>(
                builder:
                    (context, vervicationViewModel, authViewModel, child) =>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' لم يصلك الرمز ؟ ',
                              style: AppTextStyle.lightBody(
                                layout,
                              ).copyWith(color: const Color(0xff7E7575)),
                            ),
                            InkWell(
                              onTap:
                                  vervicationViewModel.canResend
                                      ? () {
                                        vervicationViewModel.startTimer();
                                        authViewModel.sendOtp(
                                          email:
                                              vervicationViewModel.userEmail!,
                                        );
                                      }
                                      : null,
                              child: Text(
                                'إعادة الارسال',
                                style: AppTextStyle.lightBody(layout).copyWith(
                                  color:
                                      vervicationViewModel.canResend
                                          ? AppColors.lightPrimaryColor
                                          : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
              ),
              SizedBox(height: layout.md),

              Consumer<VervicationViewModel>(
                builder:
                    (context, vervicationViewModel, child) =>
                        vervicationViewModel.start != 0
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text('to ${vervicationViewModel.userEmail!}'),
                                Text(
                                  'يمكنك ارسال الرمز مرة اخرى بعد ',
                                  style: AppTextStyle.lightBody(
                                    layout,
                                  ).copyWith(color: const Color(0xff7E7575)),
                                ),
                                Text(
                                  " ${vervicationViewModel.start.toString()} ثانية ",
                                  style: AppTextStyle.lightBody(
                                    layout,
                                  ).copyWith(
                                    color: AppColors.lightPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                            : SizedBox.shrink(),
              ),

              const Spacer(flex: 3),
            ],
          ),
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
