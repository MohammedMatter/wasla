import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/checkout/presentation/widgets/address_body.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Consumer<PaymentViewModel>(
          builder:
              (context, paymentViewModel, child) => IconButton(
                icon: Icon(
                  context.locale.languageCode == Locale('ar').languageCode
                      ? Icons.arrow_circle_right_outlined
                      : Icons.arrow_circle_left_outlined,

                  color: AppColors.lightPrimaryColor,

                  size: layout.fontXLarge.clamp(24.0, 32.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        ),

        title: Text(
          LangKeys.addressTitle.tr(),
          style: AppTextStyle.lightHeading1(layout),
        ),
        centerTitle: true,
      ),
      body: AdddressBody(),
    );
  }
}
