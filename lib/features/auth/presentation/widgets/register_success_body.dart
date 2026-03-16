import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';

class RegisterSuccessBody extends StatelessWidget {
  const RegisterSuccessBody({super.key, required this.layout});

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Image.asset('assets/images/success_register.png'),
            SizedBox(height: layout.lg),
            Text(
              ' تم انشاء حسابك بنجاح ',
              style: AppTextStyle.lightHeading1(layout),
            ),
            SizedBox(height: layout.md),
            Text(
              '! أهلاً بك\nيمكنك الآن استكشاف التطبيق\nوالاستفادة من جميع خدماتنا',
              textAlign: TextAlign.center,
              style: AppTextStyle.lightSubtitle(
                layout,
              ).copyWith(fontSize: layout.fontMedium),
            ),
            SizedBox(height: layout.xl),
            CustomElevatedButtonWidget(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRouter.homeView);
              },
              title: 'ابدا الان',
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
