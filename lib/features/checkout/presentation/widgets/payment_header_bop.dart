import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';

class PaymentHeaderBop extends StatelessWidget {
  const PaymentHeaderBop({super.key});
  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: ScreenSize.h(context) * 0.2,

          child: FractionallySizedBox(
            widthFactor: 0.4,
            child: SvgPicture.string(
              width: double.infinity,
              AppAssest.bankOfPalestine,
              fit: BoxFit.fill,
            ),
          ),
        ),

        Consumer<PaymentViewModel>(
          builder:
              (context, paymentViewModel, child) =>
                  paymentViewModel.isRedirectedToBank &&
                          !paymentViewModel.paymentCompleted
                      ? Text(
                        '''جاري التحويل ....''',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.lightSubtitle(
                          layout,
                        ).copyWith(fontSize: layout.fontLarge),
                      )
                      : paymentViewModel.paymentCompleted
                      ? SizedBox.fromSize()
                      : SizedBox(
                        width: double.infinity,
                        child: Text(
                          '''سيتم تحويلك الى بوابة بنك فلسطين \nلاتمام عملية الدفع بشكل أمن''',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.lightSubtitle(
                            layout,
                          ).copyWith(fontSize: layout.fontMedium),
                        ),
                      ),
        ),
      ],
    );
  }
}
