import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';

class BarcodeScannerView extends StatefulWidget {
  const BarcodeScannerView({super.key});

  @override
  State<BarcodeScannerView> createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<BarcodeScannerView> {
  final MobileScannerController controller = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ScreenSize.h(context) / 2,
            width: double.infinity,
            child: Image.asset(
              'assets/images/medicines/medicine_barcode.png',
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(layout.md),
              disabledBackgroundColor: Colors.white,
              backgroundColor: AppColors.lightPrimaryColor,

              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.lightPrimaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(layout.rlg),
              ),
            ),
            child: Text(
              'مسح الباركورد',
              style: AppTextStyle.lightBody(layout).copyWith(
                fontSize: layout.fontMedium * 1.40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
